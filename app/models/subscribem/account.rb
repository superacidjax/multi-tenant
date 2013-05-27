module Subscribem
  class Account < ActiveRecord::Base

    belongs_to :owner, :class_name => "Subscribem::User"
    accepts_nested_attributes_for :owner

    attr_accessible :name, :subdomain, :owner_attributes
  end
end
