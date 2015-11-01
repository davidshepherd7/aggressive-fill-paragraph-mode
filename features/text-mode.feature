Feature: text-mode
  Background:
    When I turn on text-mode
    When I force enable aggressive-fill-paragraph-mode
    When I clear the buffer

  Scenario: Abbrev expansion still works as normal
    When I force enable abbrev-mode
    When I add an abbrev "myabbrev" -> "X@Y1"
    When I type "hello myabbrev test"
    Then I should see "hello X@Y1 test"


  Scenario: Text mode paragraph fill
    When I type "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim "
    Then I should see:
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
porttitor est justo, sed dignissim enim
"""

  Scenario: Fill doesn't double space
    When I type "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim "
    Then I should not see "  "

  Scenario: Space doesn't double space
    When I type "foo bar"
    Then I should see "foo bar"
