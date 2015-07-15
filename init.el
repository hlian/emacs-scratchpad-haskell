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
   :config (progn
	     ; Send code to GHCi.
	     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
	     ; Bring up GHCi.
             (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
	     ; Restart GHCi.
             (define-key haskell-mode-map (kbd "C-c C-r") 'haskell-process-restart)
	     ; Insert type annotation.
             (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
	     ; Build everything.
             (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
	     ; Run arbitrary Cabal commands.
             (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

	     ; Choose an indentation mode.
             (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
	     ; Choose an interaction mode.
             (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
	     ; Turn on Flycheck.
             (add-hook 'haskell-mode-hook 'flycheck-mode)
             ))

;; You can even use use-package with first-party packages.
(use-package lisp-mode
  :commands emacs-lisp-mode
  :config (add-hook 'emacs-lisp-mode-hook
                    '(lambda ()
		       ; Compile .el files every time you save them. (Must-have.)
                       (add-hook 'after-save-hook 'emacs-lisp-byte-compile t t))))

