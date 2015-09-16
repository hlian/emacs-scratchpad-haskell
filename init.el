;; melpa is a nightlier package repository.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Cask!
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Stupid tilde files.
(setq backup-directory-alist `(("." . "~/.saves")))

;; use-package! use-package is just a set of macros, so it only needs
;; to be loaded during compile time.
(eval-when-compile
  (defvar use-package-verbose t)
  (require 'use-package))

;; You'll need this if you Haskell binaries aren't in the global OS X
;; $PATH (stored in the bowels of /etc)
(exec-path-from-shell-initialize)

;; This registers haskell-mode as an autoload for .hs files. It also
;; registers a configuration block to run whenever haskell-mode is
;; loaded. (So this should take 0 time on startup, deferring the work
;; until the first .hs buffer is opened.)
(use-package haskell-mode
  :mode "\\.hs\\'"
  :commands haskell-mode
  :config

  (custom-set-variables
   ;; Let me close GHCi without closing my source code buffers.
   '(haskell-ask-also-kill-buffers nil)
   ;; Default to using stack ('auto doesn't seem to work right).
   '(haskell-process-type 'stack-ghci))

  (add-hook 'haskell-mode-hook
            '(lambda ()
               (turn-on-haskell-indentation)
               (ghc-init)
               ;; Lets you send code to GHCi.
               (interactive-haskell-mode)
               ;; Quickly switch between ghc-mod (fast, but doesn't
               ;; catch style issues) and hlint (opposite).
               (local-set-key (kbd "C-c C-h") 'ghc-toggle-check-command)))

  ;; If ghc-mod breaks, uncomment these:
  ;; (add-hook 'haskell-mode-hook 'flycheck-haskell-setup)
  ;; (add-hook 'haskell-mode-hook 'flycheck-mode)
  ;; (add-hook 'haskell-mode-hook 'company-mode)
  )

;; You can even use use-package with first-party packages.
(use-package lisp-mode
  :commands emacs-lisp-mode
  :config (add-hook 'emacs-lisp-mode-hook
                    '(lambda ()
                       ;; Compile .el files every time you save them. (Must-have.)
                       (add-hook 'after-save-hook 'emacs-lisp-byte-compile t t))))

;; There are many keyboard shortcuts available for haskell-mode and ghc:
;; * https://github.com/haskell/haskell-mode/wiki/Haskell-Interactive-Mode-Setup
;; * http://www.mew.org/~kazu/proj/ghc-mod/en/emacs.html
