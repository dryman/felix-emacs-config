(global-visual-line-mode t)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(show-paren-mode t)
(setq-default indent-tabs-mode nil)

(add-to-list 'auto-mode-alist '("\\.\\(markdown\\|mkdn\\)" . markdown-mode))

(setq backup-directory-alist '(("." . "~/.backup_emacs"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
)

(powerline-default-theme)
(custom-set-faces
 '(mode-line ((t (:foreground "#f9f9f9"
                  :background "#bdbdbd"
                  :box nil)))) )

(defadvice org-open-at-point (around org-open-at-point-choose-browser activate)
  (let ((browse-url-browser-function
         (cond ((equal (ad-get-arg 0) '(4))
                'browse-url-generic)
               ((equal (ad-get-arg 0) '(16))
                'choose-browser)
               (t
                (lambda (url &optional new)
                  (w3m-browse-url url t)))
               )))
    ad-do-it))
