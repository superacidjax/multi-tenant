require 'spec_helper'

feature 'Accounts' do
  scenario "creating an account" do
    visit subscribem.root_path
    click_link 'Account Sign Up'
    fill_in 'Name', :with => "Test"
    fill_in 'Subdomain', :with => "test"
    fill_in "Email", :with => "subscribem@example.com"
    password_field_id = "account_owner_attributes_password"
    fill_in password_field_id, :with => "password"
    fill_in "Password confirmation", :with => "password"

    click_button "Create Account"

    page.should have_content("Signed in as subscribem@example.com")
    page.current_url.should == "http://test.example.com/"
  end

  scenario "cannot create an account with an already used subdomain" do
    Subscribem::Account.create!(:subdomain => "test", :name => "test")
    visit subscribem.root_path
    click_link 'Account Sign Up'
    fill_in 'Name', :with => "Test"
    fill_in 'Subdomain', :with => "test"
    fill_in 'Email', :with => "subscribem@example.com"
    password_field_id = "account_owner_attributes_password"
    fill_in password_field_id, :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Create Account"

    page.should have_content("Sorry, your account could not be created.")
    # page.should have_content("Subdomain has already been taken")
  end
end
