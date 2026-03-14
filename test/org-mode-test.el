;;; org-mode-test.el --- Org mode tests -*- lexical-binding: t; -*-

(require 'test-helper)

(ert-deftest org-mode-disable-inside-tables ()
  (th-fixtures #'org-mode
    (insert "| A | B | C |\n| 1 | 2 | 3 |\n| a | b | c |")
    (goto-char (point-min))
    (search-forward "A")
    (th-type " and D")
    (th-should-see "| A and D | B | C |")
    (th-should-see "| 1 | 2 | 3 |")
    (th-should-see "| a | b | c |")))

(ert-deftest org-mode-disable-inside-src-block-header ()
  (th-fixtures #'org-mode
    (insert "#+HEADER:\n#+BEGIN_SRC emacs-lisp\n(print \"Hello, world!\")\n#+END_SRC")
    (goto-char (point-min))
    (search-forward ":")
    (th-type " :results output")
    (th-should-see "#+HEADER: :results output")
    (th-should-see "#+BEGIN_SRC emacs-lisp")))

(ert-deftest org-mode-disable-inside-src-block-begin-line ()
  (th-fixtures #'org-mode
    (insert "#+BEGIN_SRC emacs-lisp\n(print \"Hello, world!\")\n#+END_SRC")
    (goto-char (point-min))
    (search-forward "lisp")
    (th-type " :results output")
    (th-should-see "#+BEGIN_SRC emacs-lisp :results output")))

(ert-deftest org-mode-comment-wrapping-no-errors ()
  (th-fixtures #'org-mode
    (insert "#")
    (th-type " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim ")))
