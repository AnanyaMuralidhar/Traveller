class SlotsController < ApplicationController
  before_action :set_slot, only: %i[ show edit update destroy ]
  before_action :set_current_trippackage

  # GET /slots or /slots.json
  def index
    @slots = Slot.all
  end

  # GET /slots/1 or /slots/1.json
  def show
  end

  # GET /slots/new
  def new
    @slot = Slot.new
    @user=User.find(params[:user_id])
    @package = Trippackage.find(params[:id])
    session[:current_trippackage_id] = @package.id
  end

  # GET /slots/1/edit
  def edit
  end

  # POST /slots or /slots.json
  def create
    @slot = Slot.new(slot_params)
    @slot.user = current_user
    @slot.trippackage = @current_trippackage

    respond_to do |format|
      if @slot.save
        format.html { redirect_to home_index_path, notice: "Slot was successfully created." }
        format.json { render :show, status: :created, location: @slot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slots/1 or /slots/1.json
  def update
    respond_to do |format|
      if @slot.update(slot_params)
        format.html { redirect_to slot_url(@slot), notice: "Slot was successfully updated." }
        format.json { render :show, status: :ok, location: @slot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slots/1 or /slots/1.json
  def destroy
    @slot.destroy

    respond_to do |format|
      format.html { redirect_to slots_url, notice: "Slot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slot
      @slot = Slot.find(params[:id])
    end

    def set_current_trippackage
  @current_trippackage = Trippackage.find_by(id: session[:current_trippackage_id])
end

    # Only allow a list of trusted parameters through.
    def slot_params
      params.require(:slot).permit(:bookingtime,:user_id, :user_name, :trippackage_id, references: [])
    end
end
