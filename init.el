;; Setup packages
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages")
			 ("marmalade"."http://marmalade-repo.org/packages/")
			 ("melpa"."http://melpa.org/packages/")))
(package-initialize)

;; Require
(require 'cl-lib)
(require 'powerline)
(require 'expand-region)
(require 'smart-window)
(require 'redo+) ;; redo+

;; Direct loading
(load-file "~/.emacs.d/configs.el")
(load-file "~/.emacs.d/utils.el")
(load-file "~/.emacs.d/keybindings.el")
