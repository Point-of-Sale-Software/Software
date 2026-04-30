module Admin
  class HomeController < BaseController
    # GET /admin
    def index
      @user = Current.user
      @active_sessions = TillSession.active
      @todays_sales = Sale.where(completed_at: Date.current.all_day)
      @todays_payments = Payment.joins(:sale)
                                .where(sales: { completed_at: Date.current.all_day })
                                .group(:method)
                                .sum(:amount)
    end
  end
end
