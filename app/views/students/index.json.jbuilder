json.array!(@students) do |student|
  json.extract! student, :id, :parent_id, :grade_id, :name, :email, :password_digest
  json.url student_url(student, format: :json)
end
