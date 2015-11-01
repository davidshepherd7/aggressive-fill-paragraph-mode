Scenario: org mode

  Background:
    When I turn on org-mode
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

  Scenario: Org comment wrapping doesn't trigger errors
    When I insert "#"
    When I type " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim "
