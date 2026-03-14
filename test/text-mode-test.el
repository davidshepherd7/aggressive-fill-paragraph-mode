;;; text-mode-test.el --- Text mode tests -*- lexical-binding: t; -*-

(require 'test-helper)

(ert-deftest text-mode-abbrev-expansion ()
  (th-fixtures #'text-mode
    (abbrev-mode 1)
    (define-abbrev global-abbrev-table "myabbrev" "X@Y1")
    (execute-kbd-macro "hello myabbrev test")
    (th-should-see "hello X@Y1 test")))

(ert-deftest text-mode-paragraph-fill ()
  (th-fixtures #'text-mode
    (th-type "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim ")
    (th-should-see "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque\nporttitor est justo, sed dignissim enim")))

(ert-deftest text-mode-fill-doesnt-double-space ()
  (th-fixtures #'text-mode
    (th-type "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim ")
    (th-should-not-see "  ")))

(ert-deftest text-mode-space-doesnt-double-space ()
  (th-fixtures #'text-mode
    (th-type "foo bar")
    (th-should-see "foo bar")))

(ert-deftest text-mode-fill-on-dot ()
  (th-fixtures #'text-mode
    (insert "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim")
    (th-type ".")
    (th-should-see "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque\nporttitor est justo, sed dignissim enim.")))

(ert-deftest text-mode-fill-on-arbitrary-characters ()
  (th-fixtures #'text-mode
    (add-to-list 'afp-fill-keys ?@)
    (insert "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim")
    (th-type "@")
    (th-should-see "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque\nporttitor est justo, sed dignissim enim@")))

(ert-deftest text-mode-can-type-double-space ()
  (th-fixtures #'text-mode
    (th-type "foo  bar")
    (th-should-see "foo  bar")))

(ert-deftest text-mode-can-double-space-full-stops ()
  (th-fixtures #'text-mode
    (th-type "Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Pellentesque porttitor est justo, sed dignissim enim")
    (th-should-see "Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Pellentesque\nporttitor est justo, sed dignissim enim")))

(ert-deftest text-mode-can-type-spaces-after-tabs ()
  (th-fixtures #'text-mode
    (th-type "foo\t bar")
    (th-should-see "foo\t bar")))
