EMACS=emacs

build :
	cask emacs -Q --batch --eval             \
	    "(progn                                \
	      (setq byte-compile-error-on-warn t)  \
	      (batch-byte-compile))" *.el

clean :
	@rm -f *.elc

test: build unit ecukes

ecukes: build
	cask exec ecukes

install:
	cask install

.PHONY:	all test unit ecukes install clean build
