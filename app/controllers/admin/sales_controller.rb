module Admin
  class SalesController < BaseController
    before_action :set_sale, only: [ :show ]

    def index
      @sales = Sale.where.not(completed_at: nil).order(completed_at: :desc)
    end

    def show
    end

    private

    def set_sale
      @sale = Sale.find(params[:id])
    end
  end
end
