class StudentsController < ApplicationController
  before_action :verificar
  before_action :set_student, only: %i[ show edit update destroy upload_image ] 
  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new    
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    
  end

  # POST /students or /students.json
  def create    
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to new_post_path, notice: t(:student_was_successfully_created) }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update     
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to new_post_path, notice: t(:student_was_successfully_updated) }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: t(:student_was_successfully_destroyed) }
      format.json { head :no_content }
    end
  end

  def upload_image
    image = Image.new(image_param)

    respond_to do |format|
      if image.upload && @student.update(profile_image_id: image.id)
        format.html { redirect_to posts_path, notice: t(:image_was_successfully_uploaded) }
        format.json { render :index, status: :ok, location: @student }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: image.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :lastname, :profile_image, :cover_photo, :description, :university, :career, :year, :country, :region, :commune, :phono, :state)
    end

    def verificar
      if !student_signed_in?
        redirect_to new_student_session_path  
      end  
    end

    def image_param
      params.require(:image).permit(:image)
    end
end