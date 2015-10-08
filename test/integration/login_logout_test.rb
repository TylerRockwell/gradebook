require 'test_helper'

class LoginLogoutTest < ActionDispatch::IntegrationTest
  test "login page works" do
    get '/login'
    assert_response :success
    get teachers_path
    assert_redirected_to login_path
    follow_redirect!
    assert_template "new"
    post login_path, sessions: {email: "not_valid@email.com", password: "notvalid" }
    assert_redirected_to login_path
    post login_path, sessions: {email: "mason@example.com", password: "cats" }
    assert_redirected_to teachers_path
    follow_redirect!
    assert_select "tr", 2
  end

  test "can create student" do
    post login_path, sessions: {email: "mason@example.com", password: "cats" }
    assert_redirected_to teachers_path
    post students_path, student: {teacher_id: 1, name: "Name", email: "name@example.com", password: "tea"}
    get teachers_path
    assert_select "tr", 2
    post students_path, student: {teacher_id: 1, name: "Name", email: "name@example.com", password: "tea"}
    get teachers_path
    assert_select "tr", 3
  end

end
