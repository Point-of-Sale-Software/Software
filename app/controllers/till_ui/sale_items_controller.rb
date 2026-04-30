module TillUi
  class SaleItemsController < BaseController
    before_action :set_sale
    before_action :set_sale_item, only: [ :destroy ]

    def create
      @item = Item.find(params[:item_id])

      existing_sale_item = @sale.sale_items.find_by(item: @item)

      if existing_sale_item
        existing_sale_item.update!(quantity: existing_sale_item.quantity + 1)
      else
        @sale.sale_items.create!(
          item: @item,
          quantity: 1,
          net_price: @item.net_price,
          vat_rate: @item.vat_rate,
          vat_price: @item.vat_price,
          gross_price: @item.gross_price
        )
      end

      redirect_to till_ui_sale_path(@sale)
    end

    def destroy
      @sale_item.destroy
      redirect_to till_ui_sale_path(@sale)
    end

    private

    def set_sale
      @sale = Sale.find(params[:sale_id])
    end

    def set_sale_item
      @sale_item = @sale.sale_items.find(params[:id])
    end
  end
end
