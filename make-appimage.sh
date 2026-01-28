#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q goldendict-ng | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/pixmaps/goldendict.png
export DESKTOP=/usr/share/applications/io.github.xiaoyifang.goldendict_ng.desktop

# Deploy dependencies
quick-sharun /usr/bin/goldendict /usr/share/goldendict

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
