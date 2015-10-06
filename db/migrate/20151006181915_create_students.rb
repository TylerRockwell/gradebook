class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :parent_id
      t.integer :grade_id
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
