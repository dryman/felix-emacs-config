;; Setup packages
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages")
			 ("marmalade"."http://marmalade-repo.org/packages/")
			 ("melpa"."http://melpa.org/packages/")))
(package-initialize)

;; Load paths
;; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-w3m/")
;; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-jabber/")
(load
 "/Users/felix/.opam/system/share/emacs/site-lisp/tuareg-site-file")
(add-to-list 'load-path
   "/Users/felix/.opam/system/share/emacs/site-lisp/")


;; Require
(require 'cl-lib)
(require 'powerline)
(require 'expand-region)
(require 'smart-window)
(require 'redo+) ;; redo+
;;(require 'mac-key-mode)
;;(mac-key-mode 1)
;; projectile
;; haskell-mode

;; Direct loading
(load-file "~/.emacs.d/configs.el")
(load-file "~/.emacs.d/utils.el")
(load-file "~/.emacs.d/keybindings.el")
(load-file "~/.emacs.d/haskell-config.el")
