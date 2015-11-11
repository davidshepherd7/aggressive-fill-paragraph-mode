;; This file contains your project specific step definitions. All
;; files in this directory whose names end with "-steps.el" will be
;; loaded automatically by Ecukes.


(When "^I fill the paragraph"
      (lambda ()
        (fill-paragraph)))

(Then "^aggressive-fill-paragraph-mode is on$"
      (lambda ()
        (cl-assert aggressive-fill-paragraph-mode)
        ))

(When "^I add an abbrev \"myabbrev\" -> \"X@Y1"
      (lambda ()
        (define-abbrev global-abbrev-table "myabbrev" "X@Y1")))

(When "^I add @ to afp-fill-keys$"
      (lambda ()
        (add-to-list 'afp-fill-keys ?@)))



;; Use these rather than espud's I turn on ...-mode because of the weird
;; minor mode toggling bug.
(When "^I force disable aggressive-fill-paragraph-mode"
      (lambda ()
        (aggressive-fill-paragraph-mode 0)))

(When "^I force enable aggressive-fill-paragraph-mode"
      (lambda ()
        (aggressive-fill-paragraph-mode 1)))

(When "^I force enable abbrev-mode"
      (lambda () (abbrev-mode 1)))

(When "^I turn off \\(.+\\)$"
      (lambda (mode-name)
        (funcall (intern mode-name) 0)))
