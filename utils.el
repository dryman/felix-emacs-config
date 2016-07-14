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

;; http://stackoverflow.com/a/10095853
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.
Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     ;; (package-installed-p 'evil)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))
