Scenario: org mode

  Background:
    # TODO: We probably should be enabling org-mode here
    When I force enable aggressive-fill-paragraph-mode
    When I clear the buffer

  Scenario: Disable inside org tables
    When I insert:
    """
    | A | B | C |
    | 1 | 2 | 3 |
    | a | b | c |
    """
    When I place the cursor after "A"
    When I type " and D"
    Then I should see:
    """
    | A and D | B | C |
    | 1 | 2 | 3 |
    | a | b | c |
    """

  Scenario: Disable inside org src-block header
    When I insert:
    """
    #+HEADER:
    #+BEGIN_SRC emacs-lisp
    (print "Hello, world!")
    #+END_SRC
    """
    When I place the cursor after ":"
    When I type " :results output"
    Then I should see:
    """
    #+HEADER: :results output
    #+BEGIN_SRC emacs-lisp
    (print "Hello, world!")
    #+END_SRC
    """

  Scenario: Disable inside org src-block begin line
    When I insert:
    """
    #+BEGIN_SRC emacs-lisp
    (print "Hello, world!")
    #+END_SRC
    """
    When I place the cursor after "lisp"
    When I type " :results output"
    Then I should see:
    """
    #+BEGIN_SRC emacs-lisp :results output
    (print "Hello, world!")
    #+END_SRC
    """

  Scenario: Org comment wrapping doesn't trigger errors
    When I insert "#"
    When I type " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim "
