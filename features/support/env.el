(require 'f)

(defvar aggressive-fill-paragraph-mode-support-path
  (f-dirname load-file-name))

(defvar aggressive-fill-paragraph-mode-features-path
  (f-parent aggressive-fill-paragraph-mode-support-path))

(defvar aggressive-fill-paragraph-mode-root-path
  (f-parent aggressive-fill-paragraph-mode-features-path))

(add-to-list 'load-path aggressive-fill-paragraph-mode-root-path)

(require 'aggressive-fill-paragraph)
(require 'espuds)
(require 'ert)

;; For testing
(require 'markdown-mode)

(Setup
 ;; Before anything has run
 )

(Before
 ;; Before each scenario is run
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )
