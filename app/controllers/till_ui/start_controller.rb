module TillUi
  class StartController < BaseController
    before_action :set_till, only: %i[ show ]

    def index
      @sessions = TillSession.active
    end

    def show
      @sale = Sale.new(till_session: @session)

      if @sale.save
        redirect_to till_ui_sale_path(@sale), notice: "Sale was successfully created."
      else
        render :index, status: :unprocessable_content
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_till
      @session = TillSession.find(params.expect(:id))
    end
  end
end
