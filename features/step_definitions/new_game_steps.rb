Given(/^I am on the new game screen$/) do
  visit('games/new')
end

When(/^I start a game$/) do
  find_button('Create Game').click
end

Then(/^I am taken to the edit game screen$/) do
  has_content?('Characters guessed')
end
