;;; -*- lexical-binding: t; -*-

(require 'ert)

;; Don't load old byte-compiled versions!
(setq load-prefer-newer t)

(require 'aggressive-fill-paragraph)

;; For testing
(require 'markdown-mode)

;;; Test helper functions

(defmacro th-fixtures (mode &rest body)
  "Set up a temp buffer in MODE with `aggressive-fill-paragraph-mode' enabled, then run BODY."
  (declare (indent 1))
  `(with-temp-buffer
     (save-window-excursion
       (set-window-buffer nil (current-buffer))
       (funcall ,mode)
       (aggressive-fill-paragraph-mode 1)
       ,@body)))

(defun th-type (string)
  "Type STRING character by character, simulating user input."
  (dolist (char (string-to-list string))
    (let ((last-command-event char))
      (insert char)
      (run-hooks 'post-self-insert-hook))))

(defun th-should-see (expected)
  "Assert that buffer contents contain EXPECTED."
  (let ((actual (buffer-string)))
    (should (string-match-p (regexp-quote expected) actual))))

(defun th-should-not-see (unexpected)
  "Assert that buffer contents do not contain UNEXPECTED."
  (let ((actual (buffer-string)))
    (should-not (string-match-p (regexp-quote unexpected) actual))))

(defun th-should-see-pattern (pattern)
  "Assert that buffer contents match regex PATTERN."
  (should (string-match-p pattern (buffer-string))))

(provide 'test-helper)
