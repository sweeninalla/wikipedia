Feature: My List
  I should be able to save the items to my Lists in the app

  @android
  Scenario: Add to reading list
    Given the user has opened the app and the app's main page is displayed
    When the user navigates to "Featured article" segment
    And tries to "Save" the item to List
    Then the item is added to "My lists" tab