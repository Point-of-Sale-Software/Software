module Admin
  class HomeController < BaseController
    # GET /admin
    def index
      @user = Current.user
    end
  end
end
