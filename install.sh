set -e

COLOR_BLUE='\e[34m'
COLOR_YELLOW='\e[33m'
COLOR_GREEN='\e[32m'
COLOR_RED='\e[31m'
NOCOLOR='\e[0m'

APP_BINARY="/usr/bin/xochitl"
CACHE_DIR="/home/root/.cache/remarkable/xochitl/qmlcache/"
PATCH_URL="https://raw.githubusercontent.com/mb1986/rm-hacks/main/patches/"
ZONEINFO_DIR="/usr/share/zoneinfo/"


uninstall () {
    rm -rf ${CACHE_DIR}*

    if [ -f "/etc/systemd/system/xochitl.service.d/evdevlamy.conf" ]; then
        rm /etc/systemd/system/xochitl.service.d/evdevlamy.conf
    fi
    if [ -z "$(ls -A /etc/systemd/system/xochitl.service.d)" ]; then
        rmdir /etc/systemd/system/xochitl.service.d
    fi
    if [ -f "/usr/lib/plugins/generic/libqevdevlamyplugin.so" ]; then
        rm /usr/lib/plugins/generic/libqevdevlamyplugin.so
    fi
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
            patch_version="0.0.4"
            ;;
        "4d066636ed653ffe59d4bc3acf55aa6cef72d795")
            patch_version="0.0.4"
            ;;
    esac
}


patch () {
    hash=$(sha1sum $APP_BINARY | cut -c1-40)

    if [ -z "$patch_version" ]; then
        find_version
    fi

    if [ -z "$patch_version" ]; then
        echo -e "${COLOR_RED}No suitable patch found...${NOCOLOR}"
        exit 1
    fi


    echo -e "${COLOR_GREEN}Trying to download and install patch: '$patch_version'${NOCOLOR}"

    pass=$(sha256sum $APP_BINARY | cut -c1-64)
    wget -O- $PATCH_URL/${patch_version}_$hash.patch | openssl aes-256-cbc -d -a -md sha512 -pbkdf2 -iter 1000000 -salt -pass pass:$pass | tar --overwrite -xjC $CACHE_DIR
}


ask () {
    while true; do
        echo -ne "${COLOR_BLUE}"
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
    fi
}


set_timezone () {
    echo -ne "${COLOR_BLUE}Your current timezone is: "
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

        echo -ne "${COLOR_BLUE}"
        read -p "Type chosen timezone: " timezone
        echo -ne "${NOCOLOR}"

        timedatectl set-timezone $timezone

        echo -ne "${COLOR_BLUE}Your new timezone is: "
        timedatectl | grep "Time zone" | xargs | cut -c12-
        echo -ne "${NOCOLOR}"
    fi
}


echo ""
echo -e "${COLOR_BLUE} rM Hacks Installer ${NOCOLOR}"
echo -e "${COLOR_BLUE}--------------------${NOCOLOR}"
echo ""

if [[ "$1" = "patch" && -n "$2" || -z "$1" ]]; then

    patch_version=$2
    patch
    echo -e "${COLOR_GREEN}The patch '$patch_version' installed successfully (hopefully)!${NOCOLOR}"

    install_stylus

    set_timezone

elif [ "$1" = "uninstall" ]; then

    uninstall
    echo -e "The patch ${COLOR_YELLOW}uninstalled${NOCOLOR} successfully!"

else

    echo "usage: install.sh [uninstall | patch <version>]"
    exit 1

fi

echo -e "${COLOR_YELLOW}Please restart your device to see effects...${NOCOLOR}"
echo "Have fun, until next time, bye!"

exit 0
