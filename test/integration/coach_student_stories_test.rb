require 'test_helper'

class CoachStudentStoriesTest < ActionDispatch::IntegrationTest
  fixtures :coaches
  
  test "Add a new student" do
    Student.delete_all
    coach_jim = coaches(:coach_jim)
    get "/coaches/" + coach_jim.id.to_s
    assert_response :success
    assert_template "show"
    get "/coaches/" + coach_jim.id.to_s + "/students/new/", coach_id: coach_jim.id
    assert_response :success
  end
end
