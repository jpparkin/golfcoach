require 'test_helper'

class CoachTest < ActiveSupport::TestCase
  fixtures :coaches
  
  test "coach attributes must not be empty" do
    coach = Coach.new
    assert coach.invalid?
    assert coach.errors[:username].any?
    assert coach.errors[:first_name].any?
    assert coach.errors[:last_name].any?
    assert coach.errors[:hashed_password].any?
    assert coach.errors[:email].any?
  end
  
  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.jpg
              http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      assert new_coach(name).valid?, "#{name} should be valid"
    end
    
    bad.each do |name|
      assert new_coach(name).invalid?, "#{name} shouldn't be valid"
    end
  end
  
  test "coach is not valid without a unique username" do
    coach = Coach.new(username: coaches(:coach_jim).username,
                      first_name: 'Dan',
                      last_name: 'Parkin',
                      hashed_password: 'apples',
                      email: 'daniel@aol.com')
    assert coach.invalid?
    assert_equal ["has already been taken"], coach.errors[:username]
  end
  
  test "coach is not valid without a unique email" do
    coach = Coach.new(username: 'dan@aol.com',
                      first_name: 'Dan',
                      last_name: 'Parkin',
                      hashed_password: 'apples',
                      email: coaches(:coach_jim).email)
    assert coach.invalid?
    assert_equal ["has already been taken"], coach.errors[:email]
  end
  
  def new_coach(image_url)
    Coach.new(username: "dan@world.com",
              first_name: "Dan",
              last_name: "Parks",
              hashed_password: "default",
              email: "dan@world.com",
              image_url: image_url)
  
  end
end
