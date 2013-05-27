require_dependency "subscribem/application_controller"

module Subscribem
  class AccountsController < ApplicationController
    expose(:account)

    def new
      account.build_owner
    end

    def create
      account = Subscribem::Account.create_with_owner(params[:account])
      if account.valid?
        force_authentication!(account, account.owner)
        flash[:success] = "You have signed up successfully."
        redirect_to subscribem.root_url(subdomain: account.subdomain)
      else
        flash[:error] = "Sorry, your account could not be created."
        render :new
      end
    end
  end
end
