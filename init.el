;; Setup packages
(require 'package)
(add-to-list 'package-archives '("marmalade"."http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa"."http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Load paths
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-w3m/")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-jabber/")

;; Require
(require 'cl)
(require 'powerline)
(require 'expand-region)
(require 'smart-window)
(require 'dired-details+)
(require 'w3m-load)
(require 'jabber-autoloads)

(exec-path-from-shell-initialize)

;; Direct loading
(load-file "~/.emacs.d/configs.el")
(load-file "~/.emacs.d/utils.el")
(load-file "~/.emacs.d/keybindings.el")
