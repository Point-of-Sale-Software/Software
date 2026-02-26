module Admin
  class TillSessionsController < BaseController
    before_action :set_till
    before_action :set_till_session, only: %i[ show close ]

    # GET /tills/1/till_sessions
    def index
      @till_sessions = @till.till_sessions
    end

    # GET /tills/1/till_sessions/1
    def show
    end

    # GET /tills/1/till_sessions/new
    def new
      @till_session = @till.till_sessions.new
    end

    # POST /tills/1/till_sessions
    def create
      @till_session = @till.till_sessions.new(till_session_params)

      if @till_session.save
        redirect_to [:admin, @till, @till_session], notice: "Till session was successfully created."
      else
        render :new, status: :unprocessable_content
      end
    end

    # PATCH /tills/1/till_sessions/1/close
    def close
      if @till_session.close!(closing_float: params[:closing_float])
        redirect_to [:admin, @till, @till_session], notice: "Till session was successfully closed."
      else
        redirect_to [:admin, @till, @till_session], notice: @till_session.errors.full_messages.to_sentence
      end
    end

    private
    def set_till
      @till = Till.find(params.expect(:till_id))
    end

    def set_till_session
      @till_session = @till.till_sessions.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def till_session_params
      params.expect(till_session: [ :opening_float ])
    end
  end
end
