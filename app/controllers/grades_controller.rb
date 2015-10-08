class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?
  before_action :teacher?, except: [:index]



  # GET /grades
  # GET /grades.json
  def index
    if @logged_in_student
      @grades = Grade.where("student_id = ?", session[:user_id])
    elsif @logged_in_parent
      @grades = Grade.where("student_id = ?", @logged_in_parent.student.id)
    end
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
    @grade.student = Student.find(params[:format])
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to @grade, notice: 'Grade was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    if @grade.update(grade_params)
      redirect_to @grade, notice: 'Grade was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
      redirect_to grades_url, notice: 'Grade was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:student_id, :assignment_name, :grade)
    end
end
