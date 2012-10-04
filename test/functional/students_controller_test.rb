require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
    @coach = coaches(:one)
    @update = {email: 'mary@world.com',
               first_name: 'Mary',
               last_name: 'Waikart',
               image_url: 'default.png'}
  end

  test "should get index" do
    get :index, :coach_id => @student.coach_id
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new, :coach_id => @student.coach_id
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, :coach_id => @student.coach_id, student: { first_name: "Mary", 
                                                               last_name: "Waikart", email: "m@world.com",
                                                               image_url: "default.png", coach_id: @student.coach_id }
    end

    assert_redirected_to coach_student_path(@student.coach_id, assigns(:student))
  end

  test "should show student" do
    get :show, :coach_id => @student.coach_id, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, :coach_id => @student.coach_id, id: @student
    assert_response :success
  end

  test "should update student" do
    put :update, :coach_id => @student.coach_id, id: @student, student: @update
    assert_redirected_to coach_student_path(@student.coach_id, assigns(:student))
  end
  
  test "back should go to coach" do
    get :show, :coach_id => @student.coach_id, id: @student
    assert_select 'a[href=?]', "/coaches/" + @student.coach_id.to_s, :text => 'Back'
  end
  
  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, :coach_id => @student.coach_id, id: @student
    end

    assert_redirected_to coach_path
  end
end
