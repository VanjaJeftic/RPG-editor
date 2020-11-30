Given("I am registered") do
  @user = User.create(:username => 'user_test', :email => 'user_test@gmail.com', :password => 'user_test')
end

Given("I visit the homepage") do
  visit root_path
end

When("I click on Sign in link") do
  click_link('Sign In')
end

When("I fill in the sign in form") do
  fill_in "Login", :with => "user_test"
  fill_in "Password", :with => "user_test"

  click_button "Sign in"
end

Then("I should see Signed in successfully") do
  expect(page).to have_content("Signed in successfully.")
end


When("I click on Sign up link") do
  click_link('Sign Up')
end

When("I fill in the sign up form") do
  fill_in "Username", :with => "user_test2"
  fill_in "Email", :with => "user_test2@gmail.com"
  fill_in "Password", :with => "user_test2"
  fill_in "Password confirmation", :with => "user_test2"

  click_button "Sign up"
end

Then("I should see Welcome! You have signed up successfully") do
  expect(page).to have_content("Welcome! You have signed up successfully.")
end

When("I click on Sign out link") do
  click_link "Sign Out"
end

Then("I should be redirected to the homepage") do
  visit root_path
end


