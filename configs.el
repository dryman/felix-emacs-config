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
