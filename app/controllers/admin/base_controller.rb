module Admin
  class BaseController < ApplicationController
    layout "admin"
    before_action :require_admin

    private

    def require_admin
      unless Current.user&.admin?
        redirect_to root_path, alert: "You do not have permission to access that page."
      end
    end
  end
end
