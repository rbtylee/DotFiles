###############################
# bbglib additions

ARCH=`/bin/uname -m | grep i686`

if [ "$ARCH" == 'i686' ]; then
  ARCH_EXT='_32'
else
  ARCH_EXT='_64'
fi

vapp() {
    # add test to see if exists
    sudo apt-get update
    echo
    echo "Packages to update:"
    echo
    pushd ~/bbglib$ARCH_EXT/Version >/dev/null
    ./cmp_versions.py
    pushd >/dev/null
}

wgetbod() {
    for i in $*; do
        if [ "$ARCH" == 'i686' ]; then
            wget "http://downloads.bodhilinux.com/jeff91/i386/$i.bod"
        else
            wget "http://downloads.bodhilinux.com/jeff91/x64/$i_64.bod"
        fi
    done
}

function bodhidown(){
  curl -s "http://www.downforeveryoneorjustme.com/http://downloads.bodhilinux.com/" | sed '/just you/!d;s/<[^>]*>//g'
  curl -s "http://www.downforeveryoneorjustme.com/http://forums.bodhilinux.com/" | sed '/just you/!d;s/<[^>]*>//g'
  curl -s "http://www.downforeveryoneorjustme.com/http://www.bodhilinux.com/" | sed '/just you/!d;s/<[^>]*>//g'
}

