;;; aggressive-fill-paragraph.el --- A minor mode to keep comment paragraphs filled

;; Author: David Shepherd <davidshepherd7@gmail.com>
;; Version: 0.0.1



;; Functions for testing conditions to suppress fill-paragraph

(defun afp-current-line ()
  (buffer-substring-no-properties (point-at-bol) (point-at-eol)))

(defun afp-markdown-inside-code-block? ()
  """Basic test for indented code blocks in markdown."""
  (and (string-equal major-mode "markdown-mode")
       (string-match-p "^    " (afp-current-line))))


(defun afp-bullet-list-in-comments? ()
  "Try to check if we are inside a bullet pointed list."
  (and (comment-only-p (point-at-bol) (point-at-eol))

       ;; TODO: extend to match any line in paragraph
       (string-match-p (concat "^[ ]*" comment-start "[ ]*[-\\*\\+]")
                       (afp-current-line))))


(defcustom afp-suppress-fill-pfunction-list
  (list #'afp-markdown-inside-code-block?
        #'afp-bullet-list-in-comments?)
  "List of predicate functions of no arguments, if any of these
  functions returns false then paragraphs will not be filled
  automatically.")



;; The main functions


(defun afp-only-fill-comments (&optional justify)
  "Replacement fill-paragraph function which only fills comments
and leaves everything else alone."
  (fill-comment-paragraph justify)

  ;; returning true says we are done with filling, don't fill anymore
  t)


(defun afp-suppress-fill? ()
  "Check all functions in afp-suppress-fill-pfunction-list"
  (-any? #'funcall afp-suppress-fill-pfunction-list))


(defun afp-choose-fill-function ()
  "Select which fill paragraph function to use"
  (cond

   ;; In certain modes it is better to use afp-only-fill-comments to avoid
   ;; strange behaviour in code.
   ((derived-mode-p 'emacs-lisp-mode 'sh-mode 'python-mode)
    #'afp-only-fill-comments)

   ;; For python we could also do something with let-binding
   ;; python-fill-paren-function so that code is left alone. This would
   ;; allow docstrings to be filled, but unfortunately filling of strings
   ;; and docstrings are both handled by the same chunk of code, so even
   ;; normal strings would be filled.

   ;; Otherwise just use the default one
   (t fill-paragraph-function)))


(defun afp-fill-then-insert-space ()
  "The main function: fill the paragraph (if not suppressed,
using the appropriate fill function), then insert a space."
  (interactive)
  (when (not (afp-suppress-fill?))
    (let ((fill-paragraph-function (afp-choose-fill-function))
          (fill-paragraph))))
  (just-one-space 1))


(defun afp-insert-space ()
  (interactive)
  (insert " "))



;; Minor mode set up

(define-minor-mode aggressive-fill-paragraph-mode
  nil
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "SPC") #'afp-fill-then-insert-space)
            (define-key map (kbd "M-SPC") #'afp-insert-space)
            map))

(defun afp-setup-recommended-hooks ()
  "Install hooks to enable aggressive-fill-paragraph-mode in recommended major modes."
  (interactive)

  (add-hook 'text-mode-hook #'aggressive-fill-paragraph-mode)
  (add-hook 'prog-mode-hook #'aggressive-fill-paragraph-mode))


(provide 'aggressive-fill-paragraph)

;;; aggressive-fill-paragraph.el ends here
