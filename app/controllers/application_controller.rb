class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :logged_in_teacher
  before_action :logged_in_student
  before_action :logged_in_parent

private
  def logged_in?
    redirect_to login_path, notice: "You must be logged in to do that." unless session[:account_type]
  end

  def teacher?
    redirect_to grades_path, notice: "You do not have access to do that." if session[:account_type] == "student"
    redirect_to grades_path, notice: "You do not have access to do that." if session[:account_type] == "parent"
  end

  def logged_in_teacher
    @logged_in_teacher = Teacher.find_by_id(session[:user_id]) if session[:account_type] == "teacher"
  end

  def logged_in_student
    @logged_in_student = Student.find_by_id(session[:user_id]) if session[:account_type] == "student"
  end

  def logged_in_parent
    @logged_in_parent = Parent.find_by_id(session[:user_id]) if session[:account_type] == "parent"
  end
end
