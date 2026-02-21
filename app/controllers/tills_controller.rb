class TillsController < ApplicationController
  before_action :set_till, only: %i[ show edit update destroy ]

  # GET /tills
  def index
    @tills = Till.all
  end

  # GET /tills/1
  def show
  end

  # GET /tills/new
  def new
    @till = Till.new
  end

  # GET /tills/1/edit
  def edit
  end

  # POST /tills
  def create
    @till = Till.new(till_params)

    if @till.save
      redirect_to @till, notice: "Till was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /tills/1
  def update
    if @till.update(till_params)
      redirect_to @till, notice: "Till was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /tills/1
  def destroy
    if @till.destroy
      redirect_to tills_path, notice: "Till was successfully destroyed.", status: :see_other
    else
      redirect_to tills_path, notice: @till.errors.full_messages.to_sentence, status: :see_other
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_till
      @till = Till.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def till_params
      params.expect(till: [ :name ])
    end
end
