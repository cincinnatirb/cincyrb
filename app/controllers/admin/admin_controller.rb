module Admin
  class AdminController < ApplicationController
    before_action :ensure_admin_role

    layout 'admin'

    private

    def ensure_admin_role
      redirect_to root_path unless admin_user_signed_in?
    end
  end
end
