EMACS=emacs

build :
	cask emacs -Q --batch --eval             \
	    "(progn                                \
	      (setq byte-compile-error-on-warn t)  \
	      (batch-byte-compile))" *.el

clean :
	@rm -f *.elc

test: build unit

unit: build
	cask exec ert-runner

install:
	cask install

.PHONY:	all test unit install clean build
