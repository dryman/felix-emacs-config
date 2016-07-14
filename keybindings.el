;; ;; command-backquote is still jump to other frame
(global-set-key (kbd "s-`") 'other-frame)

;; remap C-h
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-x?" 'help-command)

;; expand region
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "s-m") 'menu-bar-mode)

;; emacs-lisp complete
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; defined in utils.el
(global-set-key (kbd "M-'") 'toggle-comment-on-line)
