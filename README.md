## Why

Emacs is an excellent editor for Haskell, but it requires a lot of
configuration to get haskell-mode and ghc-mod installed and working.
Especially tricky is that the tools you need to set up a decent
`.emacs.d` environment aren't blessed or highlighted anywhere.

This `init.el` chooses Sane Defaults™ (use-package and Cask) to help
get you started, and comments are sprinkled liberally in case you want
to tweak it.

## Installing

Before you get started, you'll need (as of writing) `cabal-helper` in
your global stack.yaml, because it doesn't (yet) have a Stackage
entry. Open up `~/.stack/global/stack.yaml` in your favorite text
editor and make sure it looks like this.

```yaml
flags: {}
packages: []
extra-deps:
  - cabal-helper-0.6.0.0
resolver: lts-3.20
```

Go to [the Stackage website](https://www.stackage.org/lts) and use the
latest resolver. It almost definitely won't be 3.20 by the time you
read this.

When that's done, you'll be ready to clone and run the handy-dandy
setup script I wrote.

```sh
git clone https://github.com/hlian/emacs-scratchpad-haskell ~/.emacs.d
cd !$
./RUNME.sh
```

## Features

* Syntax highlighting (haskell-mode)
* Syntax checking (ghc-mod _or_ hlint)
* [All the other fantastical ghc-mod features](http://www.mew.org/~kazu/proj/ghc-mod/en/emacs.html)
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
