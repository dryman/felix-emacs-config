;; Setup packages
(require 'package)
(add-to-list 'package-archives '("marmalade"."http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa"."http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Load paths
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-w3m/")

;; Require
(require 'cl)
(require 'powerline)
(require 'expand-region)
(require 'smart-window)
;; (require 'dired-single)
;; (require 'dired-details)
(require 'dired-details+)
(require 'w3m-load)

(exec-path-from-shell-initialize)

;; Direct loading
(load-file "~/.emacs.d/configs.el")
(load-file "~/.emacs.d/utils.el")
(load-file "~/.emacs.d/keybindings.el")
