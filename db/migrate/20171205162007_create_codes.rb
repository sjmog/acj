class CreateCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :codes do |t|
      t.string :pdf
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
