require_dependency "subscribem/application_controller"

module Subscribem
  class AccountsController < ApplicationController
    expose (:account)

    def new
      account.build_owner
    end

    def create
      if account.save
        env['warden'].set_user(account.owner.id, scope: :user)
        env['warden'].set_user(account.id, scope: :account)
        flash[:success] = "Your account has been successfully created."
        redirect_to subscribem.root_url
      else
        render :new
      end
    end
  end
end
