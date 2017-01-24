(global-visual-line-mode t)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(show-paren-mode t)
(setq-default indent-tabs-mode nil)
(global-linum-mode t)
;(global-whitespace-mode t)
(evil-mode 1)
(global-evil-surround-mode 1)

(add-to-list 'auto-mode-alist '("\\.\\(markdown\\|mkdn\\)" . markdown-mode))

(setq backup-directory-alist '(("." . "~/.backup_emacs"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
)

;; mouse scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)


(powerline-default-theme)
(custom-set-faces
 '(mode-line ((t (:foreground "#f9f9f9"
                  :background "#bdbdbd"
                  :box nil)))) )

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(if (and (boundp 'disable-projectile)
     disable-projectile)
    (message "projectile is disabled")
  (projectile-global-mode))

;; orgmode gnuplot setups
(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)
   (python . t)
   (dot . t)
   (R . t)
   (C . t)
   (java . t)
   (perl . t)))
(setq org-startup-with-inline-images t)
(setq org-pretty-entities t)
(setq org-confirm-babel-evaluate nil)
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
(setq org-latex-create-formula-image-program 'dvipng)

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(setf org-html-mathjax-options
      '((path "https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML")
        (scale "100")
        (align "center")
        (indent "2em")
        (mathml nil)))
(setf org-html-mathjax-template
      "<script type=\"text/javascript\" src=\"%PATH\"></script>")

(defadvice evil-inner-word (around underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))
