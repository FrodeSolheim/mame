#!/bin/sh

set -e

. fsdeps/system.sh

if [ $SYSTEM_OS = "Linux" ]; then
fsdeps/packages/fontconfig
fi

fsdeps/packages/SDL2
fsdeps/packages/SDL2_ttf
