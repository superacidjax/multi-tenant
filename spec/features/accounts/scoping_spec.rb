require'spec_helper'
require 'subscribem/testing_support/authentication_helpers'
require 'subscribem/testing_support/factories/account_factory'
require 'subscribem/testing_support/factories/user_factory'

describe "Account scoping" do
  let!(:account_a) { FactoryGirl.create(:account_with_schema) }
  let!(:account_b) { FactoryGirl.create(:account_with_schema) }

  before do
    Apartment::Database.switch(account_a.subdomain)
    Thing.create(name: "Account A's Thing", account: account_a)
    Apartment::Database.switch(account_b.subdomain)
    Thing.create(name: "Account B's Thing", account: account_b)
    Apartment::Database.reset
  end

  it "displays only account A's records" do
    sign_in_as(user: account_a.owner, account: account_a)
    visit main_app.things_url(subdomain: account_a.subdomain)
    page.should have_content("Account A's Thing")
    page.should_not have_content("Account B's Thing")
  end

  it "displays only account B's records" do
    sign_in_as(user: account_b.owner, account: account_b)
    visit main_app.things_url(subdomain: account_b.subdomain)
    page.should have_content("Account B's Thing")
    page.should_not have_content("Account A's Thing")
  end
end