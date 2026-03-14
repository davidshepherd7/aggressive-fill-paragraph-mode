;;; c++-mode-test.el --- C++ mode tests -*- lexical-binding: t; -*-

(require 'test-helper)

(ert-deftest c++-mode-dont-fill-code ()
  (th-fixtures #'c++-mode
    (insert "void foo(int bar) {\n    int a = bar*10;\n\n")
    (th-type "return a;")
    (th-should-see "void foo(int bar) {\n    int a = bar*10;\n\nreturn a;")))

(ert-deftest c++-mode-fill-paragraphs-in-comments ()
  (th-fixtures #'c++-mode
    (th-type "// Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim ")
    (th-should-see "// Lorem ipsum dolor sit amet, consectetur adipiscing\n// elit. Pellentesque porttitor est justo, sed dignissim enim")))

(ert-deftest c++-mode-dont-fill-bulleted-list ()
  (th-fixtures #'c++-mode
    (th-type "// * Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim ")
    (th-should-see "// * Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim")))

(ert-deftest c++-mode-dont-fill-bulleted-list-tab-indented ()
  (th-fixtures #'c++-mode
    (electric-indent-mode 0)
    (insert "\t")
    (th-type "// * Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim ")
    (th-should-see "// * Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim")))
