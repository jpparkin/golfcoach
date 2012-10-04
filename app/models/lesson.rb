class Lesson < ActiveRecord::Base
  attr_accessible :date, :coach_id, :notes, :student_id
  belongs_to :student
end
