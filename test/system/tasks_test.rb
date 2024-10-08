require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "should create task" do
    visit tasks_url
    click_on "New task"

    check "Completed" if @task.completed
    fill_in "Completed at", with: @task.completed_at
    fill_in "Details", with: @task.details
    fill_in "Due date", with: @task.due_date
    check "Past due" if @task.past_due
    fill_in "Title", with: @task.title
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "should update Task" do
    visit task_url(@task)
    click_on "Edit this task", match: :first

    check "Completed" if @task.completed
    fill_in "Completed at", with: @task.completed_at.to_s
    fill_in "Details", with: @task.details
    fill_in "Due date", with: @task.due_date.to_s
    check "Past due" if @task.past_due
    fill_in "Title", with: @task.title
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "should destroy Task" do
    visit task_url(@task)
    click_on "Destroy this task", match: :first

    assert_text "Task was successfully destroyed"
  end
end
