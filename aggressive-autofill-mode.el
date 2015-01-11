





;; Functions for testing conditions to supress fill-paragraph

(defun aaf-current-line ()
  (let* ((p1 (line-beginning-position))
         (p2 (line-end-position)))
    (buffer-substring-no-properties p1 p2)))

(defun aaf-markdown-inside-code-block? ()
  """Basic test for indented code blocks in markdown."""
  (and (string-equal major-mode "markdown-mode")
       (string-match-p "^    " (aaf-current-line))))

(defcustom aaf-supress-fill-pfunction-list
  (list #'aaf-markdown-inside-code-block?)
  "List of predicate functions of no arguments, if any of these
  functions returns false then paragraphs will not be filled
  automatically.")



;; The main functions

(defun aaf-supress-fill? ()
  "Check all functions in aaf-supress-fill-pfunction-list"
  (-any? #'identity
         (mapcar #'funcall aaf-supress-fill-pfunction-list)))

(defun aaf-fill-then-insert-space ()
  (interactive)
  (when (not (aaf-supress-fill?))
    (fill-paragraph))
  (just-one-space 1))

(defun aaf-insert-space ()
  (interactive)
  (insert " "))



;; Minor mode set up

(define-minor-mode aggressive-autofill-mode
  nil
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "SPC") #'aaf-fill-then-insert-space)
            (define-key map (kbd "M-SPC") #'aaf-insert-space)
            map))

(defun aaf-setup-recommended-hooks ()
  "Install hooks to enable aggressive-autofill-mode in recommended major modes."
  (interactive)

  (add-hook 'text-mode-hook #'aggressive-autofill-mode)
  (add-hook 'prog-mode-hook #'aggressive-autofill-mode))


(provide 'aggressive-autofill-mode)
