## Why

Emacs is an excellent editor for Haskell, but it requires a lot of
configuration to get haskell-mode and ghc-mod installed and working.
Especially tricky is that the tools you need to set up a decent
`.emacs.d` environment aren't blessed or highlighted anywhere.

This `init.el` chooses Sane Defaults™ (use-package and Cask) to help
get you started, and comments are sprinkled liberally in case you want
to tweak it.

## Installing

* `git clone https://github.com/hlian/emacs-scratchpad-haskell ~/.emacs.d`
* `cd ~/.emacs.d`
* `./RUNME.sh`

## Features

* Syntax highlighting (haskell-mode)
* Syntax checking (ghc-mod _or_ hlint)
* Supports GHC 7.10 and Stack, in addition to older GHCs and Cabal
* Package management with Cask
* No impact on Emacs startup performance (use-package)

## Try this

* `cd /tmp/scratch`
* `stack new`
* `stack build` -- an unfortunate bug means you need to build before opening (as of writing)
* `emacs app/Main.hs`
* Move cursor to `IO`
* Hit `Ctrl-c`, `Ctrl-i` to do the equivalent of an `:info`
* Hit `Ctrl-c`, `Ctrl-l` to load the code into a GHCi session
* Hit `Ctrl-x`, `o` to move to the session buffer
* Type `:info IO` and hit Enter
