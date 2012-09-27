class Coach < ActiveRecord::Base
  attr_accessible :email, :first_name, :hashed_password, :image_url, :last_name, :username
  validates :username, :first_name, :last_name, :hashed_password, :email, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
