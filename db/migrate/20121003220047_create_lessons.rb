class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.datetime :date
      t.string :notes
      t.integer :coach_id
      t.integer :student_id

      t.timestamps
    end
  end
end
