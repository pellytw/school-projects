class SchoolsController < ApplicationController
  before_action :set_school, only: %i[ show edit update destroy ]

  # GET /schools or /schools.json
  def index
    @schools = School.includes(:locality).order(:name)
  end

  # GET /schools/1 or /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
    load_localities
  end

  # GET /schools/1/edit
  def edit
    load_localities
  end

  # POST /schools or /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: "School was successfully created." }
        format.json { render :show, status: :created, location: @school }
      else
        load_localities
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @school.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /schools/1 or /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: "School was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @school }
      else
        load_localities
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @school.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /schools/1 or /schools/1.json
  def destroy
    @school.destroy!

    respond_to do |format|
      format.html { redirect_to schools_path, notice: "School was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def school_params
      params.require(:school).permit(:name, :code, :address, :level, :locality_id)
    end

    def load_localities
      @localities = Locality.order(:province, :name)
    end
end
