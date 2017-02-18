;; Setup packages

(require 'package)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages")
                         ("marmalade"."http://marmalade-repo.org/packages/")
                         ("melpa"."http://melpa.org/packages/")))
(package-initialize)
(load-file "~/.emacs.d/utils.el")
(ensure-package-installed
 'exec-path-from-shell
 'expand-region
 'markdown-mode
 'powerline
 'evil
 'evil-surround
 'evil-numbers
 'projectile
 'redo+
 'gnuplot
 'magit
 'ox-reveal)

;; Require
(require 'cl-lib)
(require 'powerline)
(require 'expand-region)
(require 'redo+) ;; redo+
(require 'ox-reveal)
(require 'evil)
(require 'evil-surround)
(require 'evil-numbers)

;; Direct loading
(load-file "~/.emacs.d/configs.el")
(load-file "~/.emacs.d/keybindings.el")

;; other third-party
(add-to-list 'load-path
             "~/.emacs.d/org-ioslide")
(require 'ox-ioslide)
(require 'ox-ioslide-helper)
(load "~/.emacs.d/PG/generic/proof-site")
