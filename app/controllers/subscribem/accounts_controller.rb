require_dependency "subscribem/application_controller"

module Subscribem
  class AccountsController < ApplicationController
    expose (:account)

    def create
      if account.save
        flash[:success] = "Your account has been successfully created."
        redirect_to subscribem.root_url
      else
        render :new
      end
    end
  end
end
