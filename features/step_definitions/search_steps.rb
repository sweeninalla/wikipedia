

Then(/^I should see search results$/) do
  splash.search.search_result_returned?.should == true
end

Given(/^that the search icon is visible$/) do
  splash.search.verify_search_icon
  # sleep 10
end

When(/^the user selects the field$/) do
  splash.search.click_search_box
end

Given(/^the user has opened the app and the app's main page is displayed$/) do
  splash.home.on_home_screen?
end

And(/^that the user has search for text \("([^"]*)"\) into the search box$/) do |search_term|
  splash.search.search_enter_term(search_term)
end

And(/^the user selects an first item from list$/) do
  splash.search.tap_search_result
end

Then(/^the user is navigated to the selected page$/) do
  splash.search.verify_search_result_navigates_to_asset
end

And(/^the user selects back$/) do
  splash.search.select_back
end

Then(/^the user will see the search history list$/) do
  splash.search.click_search_box
  splash.search.verify_search_history_list
end