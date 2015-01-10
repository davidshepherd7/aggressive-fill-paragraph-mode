;; messes up python, emacs lisp, bash and should be disabled in minibuffer

(defun fill-then-insert-space ()
  (interactive)
  (fill-paragraph)
  (just-one-space 1))

(defun insert-space ()
  (interactive)
  (insert " "))

(global-set-key (kbd "SPC") #'fill-then-insert-space)
(global-set-key (kbd "M-SPC") #'insert-space)

(provide 'aggressive-autofill-mode)
