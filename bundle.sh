#!/bin/sh

set -e

. fsbuild/plugin.pre.sh

mkdir -p $PLUGIN_BINDIR
cp mame$EXE $PLUGIN_BINDIR

mkdir -p $PLUGIN_DATADIR
mkdir -p $PLUGIN_DATADIR/hash
cp fsbuild/_build/mame-src/hash/a5200.hsi $PLUGIN_DATADIR/hash
cp fsbuild/_build/mame-src/hash/a5200.xml $PLUGIN_DATADIR/hash
cp fsbuild/_build/mame-src/hash/neogeo.xml $PLUGIN_DATADIR/hash

mkdir -p $PLUGIN_READMEDIR
cp README.md $PLUGIN_READMEDIR/ReadMe.txt

mkdir -p $PLUGIN_LICENSESDIR
cp fsbuild/_build/mame-src/COPYING $PLUGIN_LICENSESDIR/MAME.txt

. fsbuild/plugin.post.sh
