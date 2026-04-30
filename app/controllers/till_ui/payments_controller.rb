module TillUi
  class PaymentsController < BaseController
    before_action :set_sale

    def new
      @payment = @sale.payments.build(amount: @sale.amount_due)
    end

    def create
      @payment = @sale.payments.build(payment_params)

      if @payment.save
        if @sale.fully_paid?
          @sale.complete!
          redirect_to complete_till_ui_sale_path(@sale)
        else
          redirect_to till_ui_sale_path(@sale), notice: "Payment recorded. Amount due: £#{'%.2f' % @sale.amount_due}"
        end
      else
        render :new, status: :unprocessable_content
      end
    end

    private

    def set_sale
      @sale = Sale.find(params[:sale_id])
    end

    def payment_params
      params.require(:payment).permit(:amount, :method)
    end
  end
end
