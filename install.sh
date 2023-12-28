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

WGET="wget"


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
        "d2e3c8ae6fb8a226cec0d95b9ad636c538ead9df")
            patch_version="0.0.7"
            qt_plugin_ver="5"
            ;;
        "f2a5b8ff42282ea8e49a4bc36e6d914dbeb7f935")
            patch_version="0.0.7"
            qt_plugin_ver="5"
            ;;
        "143aa1d2f25affbd9ee437bc1418d6f1d577b125")
            patch_version="0.0.1"
            qt_plugin_ver="5"
            ;;
        "610c8f928ee8908faa9cd7439271c46985952a30")
            patch_version="0.0.1"
            qt_plugin_ver="5"
            ;;
        "ae0d21c258c0f3d93717d9bd23eb74b68ac438db")
            patch_version="0.0.5"
            qt_plugin_ver="5"
            ;;
        "4d066636ed653ffe59d4bc3acf55aa6cef72d795")
            patch_version="0.0.5"
            qt_plugin_ver="5"
            ;;
        "830732bd53c8c94d73013a238ca0427a6c9a252f")
            patch_version="0.0.7"
            qt_plugin_ver="5"
            ;;
        "ceba98d368cc16aa6af806243969a3ba88c13bd1")
            patch_version="0.0.7"
            qt_plugin_ver="5"
            ;;
        "03af9c2bf1173b6397e89955624300ae987f7ac0")
            patch_version="0.0.7"
            qt_plugin_ver="5"
            ;;
        "b650989999a4c972a4b02e0f7ccb32b48195bfcf")
            patch_version="0.0.7"
            qt_plugin_ver="6"
            ;;
        "43bf0ef13afdc10c701ddcb4ca96993f19d919d1")
            patch_version="0.0.7"
            qt_plugin_ver="6"
            ;;
    esac
}


patch () {
    hash=$(sha1sum $APP_BINARY | cut -c1-40)

    find_version

    if [ -z "$patch_version" ]; then
        echo -e "${COLOR_ERROR}No suitable patch found for '$hash'...${NOCOLOR}"
        exit 1
    fi

    if [ -n "$patch_version_arg" ]; then
        patch_version=$patch_version_arg
    fi

    echo -e "${COLOR_SUCCESS}Trying to download and install patch: '$patch_version'${NOCOLOR}"

    pass=$(sha256sum $APP_BINARY | cut -c1-64)
    $WGET -O- $PATCH_URL/${patch_version}_$hash.patch | openssl aes-256-cbc -d -a -md sha512 -pbkdf2 -iter 1000000 -salt -pass pass:$pass | tar --overwrite -xjC $CACHE_DIR
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

try_restart_xochitl () {
    if ! systemctl --quiet restart xochitl.service 2> /dev/null || systemctl --quiet is-failed xochitl.service; then
        return 1
    fi
    # Wait 5 seconds to give xochitl a chance to startup and then crash
    sleep 5
    # Wait for remarkable-fail.service to finish running if it's running
    systemctl --quiet --wait is-active remarkable-fail.service
    if systemctl --quiet is-failed xochitl.service; then
        return 1
    fi
    return 0
}

install_stylus () {
    set +e
    ask "Would you like to install 'ddvk/remarkable-stylus'"
    resp=$?
    set -e
    if [ "$resp" -eq "0" ]; then
        upgrade_wget

        $WGET \
            "https://github.com/mb1986/remarkable-stylus/releases/download/qt${qt_plugin_ver}/libqevdevlamyplugin.so.${qt_plugin_ver}" \
            -O /usr/lib/plugins/generic/libqevdevlamyplugin.so

        mkdir -p /etc/systemd/system/xochitl.service.d
        cat << EOF > /etc/systemd/system/xochitl.service.d/evdevlamy.conf
[Service]
ExecStart=
ExecStart=/usr/bin/xochitl --system -plugin evdevlamy
EOF
        systemctl daemon-reload
    fi
}


upgrade_wget () {
    wget_path=/home/root/.local/share/rm-hacks/wget
    wget_remote=http://toltec-dev.org/thirdparty/bin/wget-v1.21.1-1
    wget_checksum=c258140f059d16d24503c62c1fdf747ca843fe4ba8fcd464a6e6bda8c3bbb6b5

    if [ -f "$wget_path" ] && ! sha256sum -c <(echo "$wget_checksum  $wget_path") > /dev/null 2>&1; then
        rm "$wget_path"
    fi

    if ! [ -f "$wget_path" ]; then
        echo "Fetching secure wget..."
        # Download and compare to hash
        mkdir -p "$(dirname "$wget_path")"
        if ! wget -q "$wget_remote" --output-document "$wget_path"; then
            echo "${COLOR_ERROR}Error: Could not fetch wget, make sure you have a stable Wi-Fi connection${NOCOLOR}"
            exit 1
        fi
    fi

    if ! sha256sum -c <(echo "$wget_checksum  $wget_path") > /dev/null 2>&1; then
        echo "${COLOR_ERROR}Error: Invalid checksum for the local wget binary${NOCOLOR}"
        exit 1
    fi

    chmod 755 "$wget_path"
    WGET="$wget_path"
}


set_timezone () {
    echo -ne "${COLOR_USER}Your current timezone is: "
    timedatectl | grep "Time zone" | xargs | cut -c12-
    echo -ne "${NOCOLOR}"
    set +e
    ask "Would you like to set different timezone"
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

    patch_version_arg=$2
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
    if ! try_restart_xochitl; then
        # TODO - Move uninstall to be something run by remarkable-fail.service if /tmp/rm-hacks-skip-onfailure exists
        #      - Have /tmp/rm-hacks-skip-onfailure be removed by xochitl upon successful startup
        #      - Don't remove /tmp/rm-hacks-skip-onfailure in this script
        #      - Rework try-restart-xochitl to wait for file to be removed or xochitl.service to fail
        echo -e "${COLOR_ERROR}Failed to restart the user interface, uninstalling...${NOCOLOR}"
        uninstall
        if ! try_restart_xochitl; then
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
