(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(defun what-face (pos)
  "Show the face at the current position"
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

;; the source code of keyboard_leds can be found at
;; http://osxbook.com/book/bonus/chapter10/kbdleds/
;; Could enable by
;; (setq ring-bell-function caps-bell)
(defun caps-bell
  (call-process-shell-command "keyboard_leds -c1; keyboard_leds -c0" nil 0 nil))

(defun ensure-package-installed (&rest packages)
  "Download the package if it were not installed"
  (mapcar
   (lambda (package)
     (if (not (package-installed-p package))
         (progn
           (package-refresh-contents)
           (package-install package))))
   packages))

;; Usage
;; (setq org-publish-project-alist
;;       (build-org-publish-alist
;;        '((notes "~/notes" "/var/www/html")
;;          (org-math "~/org-math"))))
(defun build-org-publish-alist (lst)
  (apply
   #'append
   (mapcar
    (lambda (lst)
      (let* ((project-org (concat (symbol-name (car lst)) "-org-files"))
             (project-assets (concat (symbol-name (car lst)) "-assets"))
             (base-dir (cadr lst))
             (publishing-dir
              (if (caddr lst)
                  (caddr lst)
                (concat (file-name-as-directory base-dir)))))
        (list
         (list
          project-org
          :base-directory base-dir
          :auto-sitemap t
          :publishing-directory publishing-dir
          :publishing-function 'org-html-publish-to-html)
         (list
          project-assets
          :base-directory base-dir
          :recursive
          :exclude "public_html"
          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
          :publishing-directory publishing-dir
          :publishing-function 'org-publish-attachment)
         (list (symbol-name (car lst))
               :components
               (list project-org project-assets)))))
    lst)))
