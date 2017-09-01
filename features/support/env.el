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

 (when (and (= emacs-major-version 25))
   (require 'cl-preloaded)
   (setf (symbol-function 'cl--assertion-failed)
         (lambda (form &optional string sargs args)
           "This function has been modified by espuds to remove an incorrect manual call
to the debugger in emacs 25.1. The modified version should only be used for
running the espuds tests."
           (if string
               (apply #'error string (append sargs args))
             (signal 'cl-assertion-failed `(,form ,@sargs))))))
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
