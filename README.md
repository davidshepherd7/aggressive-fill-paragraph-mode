Aggressive fill paragraph
========================

An emacs minor-mode for keeping paragraphs filled in both comments and prose.

Each time a space is inserted the current paragraph is refilled.

C-q space or `just-one-space` (usually bound to M-space) can be used to
insert a space without filling the paragraph.

Some special behaviour is implemented in a few major modes where the
default fill-paragraph behaviour would not work well, for example when code
would be filled as well as comments.


Setup
=====

Make sure that the file `aggressive-fill-paragraph.el` is loaded, then call

    (afp-setup-recommended-hooks)

to enable the minor mode in all places where it might be useful.
Alternatively use

    (add-hook '[major-mode-hook] #'aggressive-fill-paragraph-mode)

to enable aggressive-fill-paragraph-mode only in specified major modes.
