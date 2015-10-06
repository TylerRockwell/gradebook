class SessionsController < ApplicationController
  def new

  end

  def create
    teacher = Teacher.find_by_email(set_params[:email])
    if teacher && teacher.authenticate(set_params[:password])
      session[:logged_in_teacher] = true
      redirect_to teachers_path, notice: "Login successful"
    else
      redirect_to login_path, alert: "Login failed. Invalid email/password."
    end
  end

  def destroy
    session[:logged_in_teacher] = false
    redirect_to root_path, alert: "You have been logged out."
  end

  private

  def set_params
    params.require(:sessions).permit(:name, :email, :password)
  end
end
