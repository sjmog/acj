class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :github_username
      t.string :name

      t.timestamps
    end
  end
end
