class TrippackagesController < ApplicationController
  before_action :set_trippackage, only: %i[ show edit update destroy ]

  # GET /trippackages or /trippackages.json
  def index
    @trippackages = Trippackage.all
  end

  # GET /trippackages/1 or /trippackages/1.json
  def show
  end

  # GET /trippackages/new
  def new
    @trippackage = Trippackage.new
  end

  # GET /trippackages/1/edit
  def edit
  end

  # POST /trippackages or /trippackages.json
  def create
    @trippackage = Trippackage.new(trippackage_params)

    respond_to do |format|
      if @trippackage.save
        format.html { redirect_to trippackage_url(@trippackage), notice: "Trippackage was successfully created." }
        format.json { render :show, status: :created, location: @trippackage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trippackage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trippackages/1 or /trippackages/1.json
  def update
    respond_to do |format|
      if @trippackage.update(trippackage_params)
        format.html { redirect_to trippackage_url(@trippackage), notice: "Trippackage was successfully updated." }
        format.json { render :show, status: :ok, location: @trippackage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trippackage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trippackages/1 or /trippackages/1.json
  def destroy
    @trippackage.destroy

    respond_to do |format|
      format.html { redirect_to trippackages_url, notice: "Trippackage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trippackage
      @trippackage = Trippackage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trippackage_params
      params.require(:trippackage).permit(:package_name, :destination, :departure, :arrival, :budget, :description)
    end
end
