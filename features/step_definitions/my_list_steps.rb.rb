
When(/^the user navigates to "([^"]*)" segment$/) do |text|
  splash.mylist.navigate_to_featured_article text
end

And(/^tries to save the item to List$/) do
  splash.mylist.save_to_list
end

And(/^tries to "([^"]*)" the item to List$/) do |save_txt|
  splash.mylist.save_to_list(save_txt)
end

Then(/^the item is added to "([^"]*)" tab$/) do |my_list|
  splash.mylist.navigate_to_my_list my_list
end