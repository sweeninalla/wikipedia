Feature: Search
  I should be able to search programmes in the app

@android
Scenario: Search is functional on all sections of the app
  Given the user has opened the app and the app's main page is displayed
  And that the user has search for text ("ruby") into the search box
  Then I should see search results
  And the user selects an first item from list
  Then the user is navigated to the selected page
  And the user selects back
  Then the user will see the search history list




