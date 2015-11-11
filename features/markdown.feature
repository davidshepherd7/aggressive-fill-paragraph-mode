Feature: Markdown mode

  Background:
    When I turn on markdown-mode
    When I force enable aggressive-fill-paragraph-mode
    When I clear the buffer

  Scenario: Don't fill code blocks
    When I insert:
    """
    Here is some code:

        void foo(int bar) {
            int a = bar*10;
            return a;
        }
    """
    When I place the cursor after "}"
    When I type " "
    Then I should see:
    """
    Here is some code:

        void foo(int bar) {
            int a = bar*10;
            return a;
        }
    """
