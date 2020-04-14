class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :test, only: [:index, :from_applicant]
  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = current_user.applications.create(application_params)
    
    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def from_applicant
    @user = User.find(params[:user_id])
  end

  def my_applications
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    def test
      if current_user.test_user_role? or current_user.director? or current_user.admin?
        true
      else
        redirect_back(fallback_location: root_path)
      end
    end

    # Only allow a list of trusted parameters through.
    def application_params
      params.require(:application).permit(:user_id, :career_id, :scholarship_id, :period, :date_of_application)
    end
end
