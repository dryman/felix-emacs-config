;; Setup packages
(require 'package)
(add-to-list 'package-archives '("marmalade"."http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa"."http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Require
(require 'expand-region)
(require 'smart-window)

(exec-path-from-shell-initialize)

;; Direct loading
(load-file "~/.emacs.d/configs.el")
(load-file "~/.emacs.d/keybindings.el")
