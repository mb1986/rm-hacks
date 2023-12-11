set -e

COLOR_USER='\e[36m'
COLOR_WARNING='\e[33m'
COLOR_SUCCESS='\e[32m'
COLOR_ERROR='\e[31m'
NOCOLOR='\e[0m'

APP_BINARY="/usr/bin/xochitl"
CACHE_DIR="/home/root/.cache/remarkable/xochitl/qmlcache/"
PATCH_URL="https://raw.githubusercontent.com/mb1986/rm-hacks/main/patches/"
ZONEINFO_DIR="/usr/share/zoneinfo/"


uninstall () {
    rm -rf ${CACHE_DIR}*

    rm -f /etc/systemd/system/xochitl.service.d/evdevlamy.conf
    if [ -z "$(ls -A /etc/systemd/system/xochitl.service.d)" ]; then
        rmdir /etc/systemd/system/xochitl.service.d
    fi
    rm -f /etc/systemd/system/remarkable-fail.service.d/override-onfailure.conf
    if [ -z "$(ls -A /etc/systemd/system/remarkable-fail.service.d)" ]; then
        rmdir /etc/systemd/system/remarkable-fail.service.d
    fi
    rm -f /usr/lib/plugins/generic/libqevdevlamyplugin.so
    systemctl daemon-reload
    rm -f /home/root/.local/bin/rm-hacks-remarkable-fail.sh
}


find_version () {
    case $hash in
        "143aa1d2f25affbd9ee437bc1418d6f1d577b125")
            patch_version="0.0.1"
            ;;
        "610c8f928ee8908faa9cd7439271c46985952a30")
            patch_version="0.0.1"
            ;;
        "ae0d21c258c0f3d93717d9bd23eb74b68ac438db")
            patch_version="0.0.5"
            ;;
        "4d066636ed653ffe59d4bc3acf55aa6cef72d795")
            patch_version="0.0.5"
            ;;
        "830732bd53c8c94d73013a238ca0427a6c9a252f")
            patch_version="0.0.6"
            ;;
        "ceba98d368cc16aa6af806243969a3ba88c13bd1")
            patch_version="0.0.6"
            ;;
    esac
}


patch () {
    hash=$(sha1sum $APP_BINARY | cut -c1-40)

    if [ -z "$patch_version" ]; then
        find_version
    fi

    if [ -z "$patch_version" ]; then
        echo -e "${COLOR_ERROR}No suitable patch found...${NOCOLOR}"
        exit 1
    fi


    echo -e "${COLOR_SUCCESS}Trying to download and install patch: '$patch_version'${NOCOLOR}"

    pass=$(sha256sum $APP_BINARY | cut -c1-64)
    wget -O- $PATCH_URL/${patch_version}_$hash.patch | openssl aes-256-cbc -d -a -md sha512 -pbkdf2 -iter 1000000 -salt -pass pass:$pass | tar --overwrite -xjC $CACHE_DIR
    mkdir -p /etc/systemd/system/remarkable-fail.service.d
    cat << EOF > /etc/systemd/system/remarkable-fail.service.d/override-onfailure.conf
[Service]
ExecStart=
ExecStart=/home/root/.local/bin/rm-hacks-remarkable-fail.sh
EOF
    mkdir -p /home/root/.local/bin
    cat << EOF > /home/root/.local/bin/rm-hacks-remarkable-fail.sh
#!/bin/sh
if ! [ -f /tmp/rm-hacks-skip-onfailure ]; then
    exec /usr/bin/remarkable-fail.sh
fi
EOF
    chmod +x /home/root/.local/bin/rm-hacks-remarkable-fail.sh
    systemctl daemon-reload
}


ask () {
    while true; do
        echo -ne "${COLOR_USER}"
        read -p "$1 [Y/n]? " yn
        echo -ne "${NOCOLOR}"
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            "" ) return 0;;
        esac
    done
}


install_stylus () {
    set +e
    ask "Would you like to install 'ddvk/remarkable-stylus'"
    resp=$?
    set -e
    if [ "$resp" -eq "0" ]; then
        wget "https://github.com/ddvk/remarkable-stylus/releases/download/0.0.3/libqevdevlamyplugin.so" -O /usr/lib/plugins/generic/libqevdevlamyplugin.so
        mkdir -p /etc/systemd/system/xochitl.service.d
        cat << EOF > /etc/systemd/system/xochitl.service.d/evdevlamy.conf
[Service]
ExecStart=
ExecStart=/usr/bin/xochitl --system -plugin evdevlamy
EOF
        systemctl daemon-reload
    fi
}


set_timezone () {
    echo -ne "${COLOR_USER}Your current timezone is: "
    timedatectl | grep "Time zone" | xargs | cut -c12-
    echo -ne "${NOCOLOR}"
    set +e
    ask "Would you like to set proper timezone"
    resp=$?
    set -e
    if [ "$resp" -eq "0" ]; then

        all_timezones=$(timedatectl list-timezones)
        timezones=""
        for timezone in $all_timezones; do
            if [ -f "${ZONEINFO_DIR}${timezone}" ]; then
                timezones="$timezones $timezone"
            fi
        done

        echo "Possible timezones are:"
        echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------"
        echo -n $timezones | xargs -n5 | awk '{printf "%-30s %-30s %-30s %-30s %-30s\n",$1,$2,$3,$4,$5 }'
        echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------"

        echo -ne "${COLOR_USER}"
        read -p "Type chosen timezone: " timezone
        echo -ne "${NOCOLOR}"

        timedatectl set-timezone $timezone

        echo -ne "${COLOR_USER}Your new timezone is: "
        timedatectl | grep "Time zone" | xargs | cut -c12-
        echo -ne "${NOCOLOR}"
    fi
}


echo ""
echo -e "${COLOR_USER} rM Hacks Installer ${NOCOLOR}"
echo -e "${COLOR_USER}--------------------${NOCOLOR}"
echo ""

if [[ "$1" = "patch" && -n "$2" || -z "$1" ]]; then

    patch_version=$2
    patch
    echo -e "${COLOR_SUCCESS}The patch '$patch_version' installed successfully (hopefully)!${NOCOLOR}"

    install_stylus

    set_timezone

elif [ "$1" = "uninstall" ]; then

    uninstall
    echo -e "The patch ${COLOR_WARNING}uninstalled${NOCOLOR} successfully!"

else

    echo "usage: install.sh [uninstall | patch <version>]"
    exit 1

fi

# Apply changes if the xochitl service is active
if systemctl --quiet is-active xochitl.service 2> /dev/null; then
    touch /tmp/rm-hacks-skip-onfailure
    if ! systemctl --quiet restart xochitl.service 2> /dev/null || systemctl --quiet is-failed xochitl.service; then
        echo -e "${COLOR_ERROR}Failed to restart the user interface, uninstalling...${NOCOLOR}"
        uninstall
        if ! systemctl --quiet restart xochitl.service 2> /dev/null || systemctl --quiet is-failed xochitl.service; then
            echo -e "${COLOR_ERROR}Failed to restart the user interface again. Something has gone very wrong."
            echo -e "DO NOT RESTART YOUR DEVICE."
            echo -e "The user interface is failing to start, so you may lose access to the device if you restart it.{NOCOLOR}"
        else
            echo -e "${COLOR_ERROR}Installation has failed but successfully uninstalled${NOCOLOR}"
        fi
        echo -e "${COLOR_WARNING}Please open an issue to get help resolving why installation has failed: https://github.com/mb1986/rm-hacks/issues/new{$NOCOLOR}"
    fi
    rm /tmp/rm-hacks-skip-onfailure
else
    echo -e "${COLOR_WARNING}Please restart the xochitl application, or your device to see effects...${NOCOLOR}"
fi

# TODO - add support for different launchers
echo "Have fun, until next time, bye!"
exit 0
