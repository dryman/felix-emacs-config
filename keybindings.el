;; mouse scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)

;; the source code of keyboard_leds can be found at
;; http://osxbook.com/book/bonus/chapter10/kbdleds/
(setq ring-bell-function
      (lambda ()
        (call-process-shell-command "keyboard_leds -c1; keyboard_leds -c0" nil 0 nil)))


;; switch meta and command
(defun mac-switch-meta nil
  "switch meta between Option and Command"
  (interactive)
  (if (eq mac-option-modifier nil)
      (progn
        (setq mac-option-modifier 'meta)
        (setq mac-command-modifier 'super)
        (setq mac-right-option-modifier 'meta))
    (progn
      (setq mac-option-modifier 'super)
      (setq mac-command-modifier 'meta)
      (setq mac-right-option-modifier 'control))))

(mac-switch-meta)

;; alt-tab as meta-tab
(global-set-key (kbd "s-<tab>") (kbd "M-<tab>"))

;; command-backquote is still jump to other frame
(global-set-key (kbd "M-`") 'other-frame)

;; remap C-h
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-x?" 'help-command)

;; expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; emacs-lisp complete
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; view docs
(fset 'doc-prev "\C-xo\C-x[\C-xo")
(fset 'doc-next "\C-xo\C-x]\C-xo")
(global-set-key (kbd "M-[") 'doc-prev)
(global-set-key (kbd "M-]") 'doc-next)


;; defined in utils.el
(global-set-key (kbd "M-'") 'toggle-comment-on-line)
