set -e

COLOR_YELLOW='\e[33m'
COLOR_GREEN='\e[32m'
COLOR_RED='\e[31m'
NOCOLOR='\e[0m'

APP_BINARY="/usr/bin/xochitl"
CACHE_DIR="/home/root/.cache/remarkable/xochitl/qmlcache/"
PATCH_URL="https://raw.githubusercontent.com/mb1986/rm-hacks/main/patches/"

hash=$(sha1sum $APP_BINARY | head -c40)
case $hash in
    "143aa1d2f25affbd9ee437bc1418d6f1d577b125")
        patch_version="0.0.1"
        app_version="3.6.1.1894"
        revision="1"
        ;;
    "610c8f928ee8908faa9cd7439271c46985952a30")
        patch_version="0.0.1"
        app_version="3.6.1.1894"
        revision="2"
        ;;
    *)
        echo -e "${COLOR_RED}No suitable patch found for your version :(${NOCOLOR}"
        exit 1
        ;;
esac

echo -e "${COLOR_GREEN}Patch $patch_version found - downloading and installing :)${NOCOLOR}"
pass=$(sha256sum $APP_BINARY | head -c64)

wget -O- $PATCH_URL/${app_version}_$revision/$patch_version.patch | openssl aes-256-cbc -d -a -md sha512 -pbkdf2 -iter 1000000 -salt -pass pass:$pass | tar --overwrite -xjC $CACHE_DIR

echo "The patch should be already in place :)"
echo -e "${COLOR_YELLOW}Please restart your device to see effects...${NOCOLOR}"
echo "Have fun, until next time, bye!"

exit 0
