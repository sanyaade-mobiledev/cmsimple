@javascript
Feature: As a user I should be able to edit pages on the site

  Scenario: As a user I should be able to view a page with custom content at a specified path
    Given a page exists at a custom path with custom content
    When I visit that page's edit path
    Then I should be able to edit that page's content

  Scenario: As a user I want to be able to insert a snippet into a pages content
    Given a page exists at a custom path with custom content
    And I visit that page's edit path
    And the content of the editable region is simple content
    And I make a selection

    When I open the snippet panel
    And I drag the example snippet into the editable region
    Then the modal window should be visible
    And I should see "Snippet Options" within the modal title

    When I fill in "First name" with "Fred"
    And fill in "Last name" with "Flinstone"
    And press "Create Snippet"
    Then the modal window should not be visible
    And the contents of the editable region should be "this is <div data-version='1' data-snippet='snippet_0' class='mercury-snippet example-snippet' contenteditable='false'><h1>Fred Flinstone</h1></div><span>simple</span> <b>content</b>"

    When I save and reload the page
    Then the contents of the editable region should be "this is <div data-version='1' data-snippet='snippet_0' class='mercury-snippet example-snippet' contenteditable='false'><h1>Fred Flinstone</h1></div><span>simple</span> <b>content</b>"

    When I edit the snippet
    Then the "First name" field should contain "Fred"
    And the "Last name" field should contain "Flinstone"
    And the editor won't prompt when leaving the page

  Scenario: As a user I want to be able to edit the meta data of a page
    Given a page exists at a custom path with custom content
    And I visit that page's edit path
    When I edit the page's metadata
    And I change the slug to "new_path"
    Then I should be on "/editor/new_path"

  Scenario: As a user I want to be able to change the template of a page
    Given a page exists at a custom path with custom content
    And I visit that page's edit path
    When I edit the page's metadata
    And I change the template to "test"
    Then I should see "Test template with content" in the content frame

  @allow_hidden_elements
  Scenario: As a user I want to be able to change the SEO info of a page
    Given a page exists at a custom path with custom content
    And I visit that page's edit path
    When I edit the page's metadata
    And I change the seo info of the page
    Then I should see that seo info on the page

