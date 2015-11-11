Feature: The ecukes tests

  Background:
    When I force enable aggressive-fill-paragraph-mode
    When I clear the buffer

  Scenario: The mode is enabled correctly by When
    Then aggressive-fill-paragraph-mode is on

  # Run the test twice to make sure it's not just toggling the mode (this
  # actually happened!).
  Scenario: The mode is not just being toggled
    Then aggressive-fill-paragraph-mode is on

  Scenario: We can compare paragraph fills
    When I force disable aggressive-fill-paragraph-mode
    When I turn on text-mode
    When I type "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim"
    And I fill the paragraph
    Then I should see:
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
porttitor est justo, sed dignissim enim
"""

  Scenario: The buffer is cleared between tests
    Then I should not see "Lorem ipsum"

  Scenario: Abbrev expansion steps work
    When I force disable aggressive-fill-paragraph-mode
    When I force enable abbrev-mode
    When I add an abbrev "myabbrev" -> "X@Y1"
    When I type "hello myabbrev test"
    Then I should see "hello X@Y1 test"
