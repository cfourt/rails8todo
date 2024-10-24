require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @task = tasks(:one)
    @user = @task.user
    sign_in @user
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: { task: { user_id: @user.id, completed: @task.completed, completed_at: @task.completed_at, details: @task.details, due_date: @task.due_date, past_due: @task.past_due, title: @task.title } }
    end

    assert_redirected_to tasks_url
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { user_id: @user.id, completed: @task.completed, completed_at: @task.completed_at, details: @task.details, due_date: @task.due_date, past_due: @task.past_due, title: @task.title } }
    assert_redirected_to tasks_url
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end

  test "should toggle task.completed" do
    assert_changes "@task.reload.completed",
                   from: @task.completed,
                   to: !@task.completed do
      patch toggle_complete_task_url(@task), as: :json
    end

    assert_response :success
  end
end
