require_dependency "subscribem/application_controller"

module Subscribem
  class Account::UsersController < ApplicationController

    def new
      @user = Subscribem::User.new
    end

    def create
      account = Subscribem::Account.find_by_subdomain!(request.subdomain)
      user = Subscribem::User.create(params[:user])
      force_authentication!(account, user)
      flash[:success] = "You have signed up successfully"
      redirect_to root_path
    end

  end
end
