require 'test_helper'
require 'delorean'

class CoachesControllerTest < ActionController::TestCase
  setup do
    @coach = coaches(:one)
    @empty_coach = coaches(:two)
    @student = students(:student_paul)
    @coach.students << @student
    @student.lessons << lessons(:one)
    @student.lessons << lessons(:two)
    @student.lessons << lessons(:three)
    @update = {
      username: 'james@world.com',
      first_name: 'james',
      last_name: 'Parks',
      hashed_password: 'defaulttest',
      email: 'james@world.com',
      image_url: 'default.png'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coaches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coach" do
    assert_difference('Coach.count') do
      post :create, coach: @update
    end

    assert_redirected_to coach_path(assigns(:coach))
  end

  test "should show coach" do
    get :show, id: @coach 
    assert_response :success
  end
  
  test "should show lessons for today of coach" do
    get :show, id: @coach
    assert_equal 2, assigns(:lessons).size, "The wrong number of lessons are displayed"
  end
  
  test "display No Lessons if today has no lessons" do
    get :show, id: @empty_coach
    assert_select "h3 + p", :text => 'No Lessons'
  end
    
  test "should show lessons for today when view_lessons=day" do
    get :show, id: @coach, view_lessons: "day"
    assert_equal 2, assigns(:lessons).size
  end

  test "should get edit" do
    get :edit, id: @coach
    assert_response :success
  end
  
  test "back on edit should go to show" do
    get :edit, id: @coach
    assert_select 'a[href=?]', "/coaches/1", :text => 'Back'
  end

  test "should update coach" do
    put :update, id: @coach, coach: @update
    assert_redirected_to coach_path(assigns(:coach))
  end

  test "should destroy coach" do
    assert_difference('Coach.count', -1) do
      delete :destroy, id: @coach
    end

    assert_redirected_to coaches_path
  end
end
