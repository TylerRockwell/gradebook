json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :student_id, :name, :email, :password_digest
  json.url teacher_url(teacher, format: :json)
end
