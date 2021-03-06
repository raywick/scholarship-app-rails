class ScholarshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_scholarship, only: [:show, :edit, :update, :destroy]
  before_action :test, except: [:index, :show]
  # GET /scholarships
  # GET /scholarships.json
  def index
    @scholarships = Scholarship.all
  end

  # GET /scholarships/1
  # GET /scholarships/1.json
  def show
  end

  # GET /scholarships/new
  def new
    @scholarship = Scholarship.new
  end

  # GET /scholarships/1/edit
  def edit
  end

  # POST /scholarships
  # POST /scholarships.json
  def create
    @scholarship = Scholarship.new(scholarship_params)

    respond_to do |format|
      if @scholarship.save
        format.html { redirect_to @scholarship, notice: 'Scholarship was successfully created.' }
        format.json { render :show, status: :created, location: @scholarship }
      else
        format.html { render :new }
        format.json { render json: @scholarship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scholarships/1
  # PATCH/PUT /scholarships/1.json
  def update
    respond_to do |format|
      if @scholarship.update(scholarship_params)
        format.html { redirect_to @scholarship, notice: 'Scholarship was successfully updated.' }
        format.json { render :show, status: :ok, location: @scholarship }
      else
        format.html { render :edit }
        format.json { render json: @scholarship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scholarships/1
  # DELETE /scholarships/1.json
  def destroy
    @scholarship.destroy
    respond_to do |format|
      format.html { redirect_to scholarships_url, notice: 'Scholarship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scholarship
      @scholarship = Scholarship.find(params[:id])
    end

    def test
      if current_user.test_user_role? or current_user.director? or current_user.admin?
        true
      else
        redirect_back(fallback_location: root_path)
      end
    end

    # Only allow a list of trusted parameters through.
    def scholarship_params
      params.require(:scholarship).permit(:status, :details)
    end
end
