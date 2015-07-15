#!/bin/sh

set -eux

US=$(dirname "$0")
pushd $US > /dev/null

CASK=$(which cask)
if [[ $? == 0 ]]; then
    echo "Found cask: $CASK"
else
    echo "Installing cask..."
    curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
    which cask > /dev/null || (echo "Couldn't install cask!"; exit 1)
fi

cask install
which runhaskell > /dev/null || (echo "Couldn't find runhaskell! You'll need it for Flycheck.")

popd > /dev/null
