Scenario: C++ mode

  Background:
    When I turn on c++-mode
    When I force enable aggressive-fill-paragraph-mode
    When the buffer is empty

  Scenario: Don't fill code
    When I insert:
    """
    void foo(int bar) {
        int a = bar*10;

    """
    When I type "return a;"
    Then I should see:
    """
    void foo(int bar) {
        int a = bar*10;
        return a;
    """

  Scenario: Fill paragraphs in comments
    When I type "// Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim "
    Then I should see:
"""
// Lorem ipsum dolor sit amet, consectetur adipiscing
// elit. Pellentesque porttitor est justo, sed dignissim enim
"""

  Scenario: Don't fill bulleted list
    When I type "// * Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim "
    Then I should see "// * Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim"

  # The insert " " statement is a tab symbol, typing it doesn't work
  # (probably gets converted to spaces).
  Scenario: Don't fill bulleted list even when tab indented
    When I turn off electric-indent-mode
    When I insert "	"
    When I type "// * Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim "
    Then I should see "// * Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque porttitor est justo, sed dignissim enim"
