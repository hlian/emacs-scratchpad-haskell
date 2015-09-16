#!/bin/sh

set -eux

US=$(dirname "$0")
pushd $US > /dev/null

CASK=$(which cask) || {
    echo "Installing cask..."
    curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
    which cask > /dev/null || (echo "Couldn't install cask!"; exit 1)
}

STACK=$(which stack) || {
    echo "You need to install Stack from <https://github.com/commercialhaskell/stack/releases/tag/v0.1.4.0>."
}

echo "Found stack: $STACK"
echo "Found cask: $CASK"
cask install
popd > /dev/null
