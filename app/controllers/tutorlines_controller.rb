class TutorlinesController < ApplicationController
  before_action :set_tutorline, only: [:show, :update, :destroy]

  # GET /tutorlines
  def index
    @tutorlines = Tutorline.all

    render json: @tutorlines
  end

  # GET /tutorlines/1
  def show
    render json: @tutorline
  end

  # POST /tutorlines
  def create
    @tutorline = Tutorline.new(tutorline_params)

    if @tutorline.save
      render json: @tutorline, status: :created, location: @tutorline
    else
      render json: @tutorline.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tutorlines/1
  def update
    if @tutorline.update(tutorline_params)
      render json: @tutorline
    else
      render json: @tutorline.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tutorlines/1
  def destroy
    @tutorline.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorline
      @tutorline = Tutorline.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tutorline_params
      params.fetch(:tutorline, {})
    end
end
