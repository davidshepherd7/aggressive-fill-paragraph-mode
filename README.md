Aggressive autofill mode
========================

An emacs minor-mode for keeping paragraphs filled in both comments and prose.

Each time a space is inserted the current paragraph is refilled.

M-space can be used to only insert a space (chosen because the behaviour of
space with this mode is enabled is very similar to `just-one-space`, which
is ususally bound to M-space).


Setup
=====

Make sure that the file `aggressive-autofill-mode.el` is loaded, then call

    (aaf-setup-recommended-hooks)

to enable the minor mode in all places where it might be useful.
