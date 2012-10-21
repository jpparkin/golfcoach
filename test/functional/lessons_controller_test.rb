require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  setup do
    @lesson = lessons(:one)
    @coach = coaches(:one)
    @student = students(:student_paul)
  end

  test "should get index" do
    get :index, :coach_id => @lesson.coach_id, :student_id => @lesson.student_id
    assert_response :success
    assert_not_nil assigns(:lessons)
  end

  test "should get new" do
    get :new, :coach_id => @lesson.coach_id, :student_id => @lesson.student_id
    assert_response :success
  end

  test "should create lesson" do
    assert_difference('Lesson.count') do
      post :create, :coach_id => @lesson.coach_id, :student_id => @lesson.student_id, lesson: { coach_id: @lesson.coach_id, notes: @lesson.notes, student_id: @lesson.student_id }
    end

    assert_redirected_to coach_path(@coach)
  end

  test "should show lesson" do
    get :show, :coach_id => @lesson.coach_id, :student_id => @lesson.student_id, id: @lesson
    assert_response :success
  end

  test "should get edit" do
    get :edit, :coach_id => @lesson.coach_id, :student_id => @lesson.student_id, id: @lesson
    assert_response :success
  end

  test "should update lesson" do
    put :update, :coach_id => @lesson.coach_id, :student_id => @lesson.student_id, id: @lesson, lesson: { coach_id: @lesson.coach_id, notes: @lesson.notes, student_id: @lesson.student_id }
    assert_redirected_to coach_student_lesson_path(@coach, @student, assigns(:lesson))
  end

  test "should destroy lesson" do
    assert_difference('Lesson.count', -1) do
      delete :destroy, :coach_id => @coach.id, :student_id => @student.id, id: @lesson
    end

    assert_redirected_to coach_path
  end
end
