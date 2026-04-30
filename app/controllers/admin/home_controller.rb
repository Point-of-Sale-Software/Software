module Admin
  class HomeController < BaseController
    # GET /admin
    def index
      @user = Current.user
      @active_sessions = TillSession.active
      @todays_sales = Sale.where(completed_at: Date.current.all_day)
    end
  end
end
