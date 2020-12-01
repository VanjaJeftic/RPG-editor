Given('I visit the index page') do
  visit types_path(@user)
  expect(page).to have_content('Character Types')
end

When('I click on link Create Type and fill the form') do
  click_link('Create New Type')
  @type = FactoryBot.create(:type,
                            name: 'Type2Example',
                            user_id: @user.id)
end

Then('I should see a new type') do
  visit types_path(@user)
  expect(page).to have_content('Type2Example')
end

When('I click on Edit link') do
  click_link('Edit')
end

Then('I should see form with Create new type title') do
  expect(page).to have_content('Create new type')
end

Given('I am on index page') do
  visit types_path(@user)
end

Then('I see created type') do
  expect(page).to have_content('Type2Example')
end

When('I change type name') do
  fill_in 'type_name', with: 'TestEdit'
end

When('I click on button Update Type') do
  click_button 'Update Type'
end

Then('I should see in table updated name') do
  expect(page).to have_content('TestEdit')
end

When('I click on Destroy link') do
  click_link('Destroy')
end

Then('I should not see created Type') do
  expect(page).to have_no_content('Type2Example')
end

And('I confirm popup') do
  page.driver.browser.switch_to.alert.accept
end
