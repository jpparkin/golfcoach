class Student < ActiveRecord::Base
  attr_accessible :email, :first_name, :image_url, :last_name, :coach_id
  validates :email, :first_name, :last_name, :coach_id, presence: true
  validates :email, :uniqueness => {:scope => :coach_id, 
    :message => "a Student with this email address already exists" }
  belongs_to :coach
  has_many :lessons
end
