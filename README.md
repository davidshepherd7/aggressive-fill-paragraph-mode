Aggressive fill paragraph
========================

[![travis](https://travis-ci.org/davidshepherd7/aggressive-fill-paragraph-mode.svg?branch=master)](https://travis-ci.org/davidshepherd7/aggressive-fill-paragraph-mode) [![melpa](http://melpa.org/packages/aggressive-fill-paragraph-badge.svg)](http://melpa.org/#/aggressive-fill-paragraph) 


An emacs minor-mode for keeping paragraphs filled in both comments and prose.

Each time a space is inserted the current paragraph is refilled.

C-q space or `just-one-space` (usually bound to M-space) can be used to
insert a space without filling the paragraph.

Some special behaviour is implemented in a few major modes where the
default fill-paragraph behaviour would not work well, for example when code
would be filled as well as comments.


Setup
-----

Make sure that the file `aggressive-fill-paragraph.el` is loaded, then call

    (afp-setup-recommended-hooks)

to enable the minor mode in all places where it might be useful.
Alternatively use

    (add-hook '[major-mode-hook] #'aggressive-fill-paragraph-mode)

to enable aggressive-fill-paragraph-mode only in specified major modes.

You can customise which keys trigger a fill with the `afp-fill-keys` variable,
by default both ` ` and `.` are used.


Compatibility with new major modes
---------------------------------

There seems to be little consensus between different major modes on what
exactly `fill-paragraph` should fill. For example some programming modes
stick to filling comments, while others attempt to fill other things such
as code and strings.

Typically automatic filling of code paragraphs is not very helpful, so we
want to disable it. For simple cases where the standard emacs comment
filling behaviour (as implemented in `fill-comment-paragraph`) suffices this can be
done by simply adding the major mode to `afp-fill-comments-only-mode-list`,
e.g.

    (add-to-list 'afp-fill-comments-only-mode-list 'python-mode)

Please submit a bug report or pull request if you find a mode that should
be in this list by default.

More complex cases will probably require modifications to
`aggressive-fill-paragraph.el`.
