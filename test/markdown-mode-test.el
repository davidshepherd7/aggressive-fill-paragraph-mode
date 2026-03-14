;;; markdown-mode-test.el --- Markdown mode tests -*- lexical-binding: t; -*-

(require 'test-helper)

(ert-deftest markdown-mode-dont-fill-code-blocks ()
  (th-fixtures #'markdown-mode
    (insert "Here is some code:\n\n    void foo(int bar) {\n        int a = bar*10;\n        return a;\n    }")
    (search-backward "}")
    (end-of-line)
    (th-type " ")
    (th-should-see "Here is some code:\n\n    void foo(int bar) {\n        int a = bar*10;\n        return a;\n    }")))
