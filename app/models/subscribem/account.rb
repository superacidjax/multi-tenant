module Subscribem
  class Account < ActiveRecord::Base

    belongs_to :owner, class_name: "Subscribem::User"
    accepts_nested_attributes_for :owner

    attr_accessible :name, :subdomain, :owner_attributes
    validates :subdomain, presence: true, uniqueness: true

    has_many :accounts_users, class_name: "Subscribem::AccountsUser"
    has_many :users, through: :accounts_users

    def self.create_with_owner(params={})
      account = new(params)
      if account.save
        account.users << account.owner
      end
      account
    end

    def create_schema
      Apartment::Database.create(subdomain)
    end
  end
end