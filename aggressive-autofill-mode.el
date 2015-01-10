

;; Automatically call fill paragraph when space is pressed when
;; appropriate (i.e. inside comments, in text modes).

(defun aaf-fill-then-insert-space ()
  (interactive)
  (fill-paragraph)
  (just-one-space 1))

(defun aaf-insert-space ()
  (interactive)
  (insert " "))

(define-minor-mode aggressive-autofill-mode
  nil
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "SPC") #'aaf-fill-then-insert-space)
            (define-key map (kbd "M-SPC") #'aaf-insert-space)
            map))

 (provide 'aggressive-autofill-mode)
