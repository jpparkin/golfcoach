require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  fixtures :students
  
  test "student attributes must not be empty" do
      student = Student.new
      assert student.invalid?
      assert student.errors[:first_name].any?
      assert student.errors[:last_name].any?
      assert student.errors[:email].any?
      assert student.errors[:coach_id].any?
  end
  
  test "student is not unique if the email and coach_id combination already exists" do
    student = Student.new(first_name: 'Elaine',
                          last_name: 'Parkin',
                          email: students(:student_paul).email,
                          coach_id: students(:student_paul).coach_id,
                          image_url: 'default.png')
    assert student.invalid?, "student should be invalid"
    assert_equal ["a Student with this email address already exists"], student.errors[:email]
  end
  

end
