module TillUi
  class SalesController < BaseController
    before_action :set_sale

    def show
      if @sale.completed?
        redirect_to complete_till_ui_sale_path(@sale)
        return
      end

      @items = Item.all
      @sale_items = @sale.sale_items.includes(:item)
    end

    def complete
      if @sale.completed?
        render :complete
      elsif @sale.fully_paid?
        @sale.complete!
        render :complete
      else
        redirect_to till_ui_sale_path(@sale), alert: "Sale is not fully paid."
      end
    end

    private

    def set_sale
      @sale = Sale.find(params.expect(:id))
    end
  end
end
