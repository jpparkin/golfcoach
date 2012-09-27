class Coach < ActiveRecord::Base
  attr_accessible :email, :first_name, :hashed_password, :image_url, :last_name, :username
end
