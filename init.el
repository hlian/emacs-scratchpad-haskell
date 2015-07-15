;; melpa is a nightlier package repository.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Cask!
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; use-package! use-package is just a set of macros, so it only needs
;; to be loaded during compile time.
(eval-when-compile
  (defvar use-package-verbose t)
  (require 'use-package))

; You'll need this if you Haskell binaries aren't in the global OS X
; $PATH (stored in the bowels of /etc)
(exec-path-from-shell-initialize)

(use-package haskell-mode
   :mode "\\.hs\\'"
   :commands haskell-mode
   :config (progn
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

