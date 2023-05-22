class FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[ show edit update destroy ]
  before_action :set_current_company

  # GET /feedbacks or /feedbacks.json
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1 or /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
    @user=User.find(params[:user_id])
    @company = Company.find(params[:id])
    session[:current_company_id] = @company.id
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks or /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user
    @feedback.company = @current_company

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to home_myslots_path(id:current_user.id), notice: "Feedback was successfully created." }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1 or /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to feedback_url(@feedback), notice: "Feedback was successfully updated." }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1 or /feedbacks/1.json
  def destroy
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: "Feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def set_current_company
      @current_company = Company.find_by(id: session[:current_company_id])
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:rate, :descr, :user_id, :company_id)
    end
end
