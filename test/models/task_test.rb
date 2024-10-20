# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  completed    :boolean
#  completed_at :datetime
#  details      :text
#  due_date     :datetime
#  past_due     :boolean
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
# Indexes
#
#  index_tasks_on_due_date  (due_date) WHERE completed = false /*application='Todo'*/
#  index_tasks_on_user_id   (user_id)
#
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should not save task without user" do
    task = Task.new(title: "Test Task")
    assert_not task.save, "Saved the task without a user"
  end

  test "should not save task without title" do
    task = Task.new(user: users(:one)) # Create a task without a title
    assert_not task.valid?, "Task should not be valid without a title"
    assert_includes task.errors[:title], "can't be blank", "Task should have a validation error for title"
    assert_not task.save, "Saved the task without a title" # Ensure it does not save
  end

  test "should mark task as past due if due_date has passed" do
    task = tasks(:one)
    task.update(due_date: 2.days.ago)

    task.run_callbacks(:validation) # manually trigger callbacks
    assert task.past_due, "Task was not marked as past due"
  end

  test "should order tasks by completion status" do
    skip "TODO"
    completed_task = Task.create!(user: users(:one), title: "Completed Task", completed: true)
    nil_task = Task.create!(user: users(:one), title: "Nil Task", completed: nil)
    incomplete_task = Task.create!(user: users(:one), title: "Incomplete Task", completed: false)

    ordered_tasks = Task.order_by_completion
    assert_equal [incomplete_task, nil_task, completed_task], ordered_tasks, "Tasks were not ordered by completion"
  end

  test "past_due? should return true if task is past due" do
    task = Task.create!(user: users(:one), title: "Task", due_date: 1.day.ago)
    assert task.past_due?, "Task was not correctly marked as past due"
  end

  test "past_due? should return false if task is not past due" do
    task = Task.create!(user: users(:one), title: "Task", due_date: 1.day.from_now)
    assert_not task.past_due?, "Task was incorrectly marked as past due"
  end

  test "should not mark task as past due without a due date" do
    task = Task.create!(user: users(:one), title: "Task without due date")
    task.run_callbacks(:validation)
    assert_not task.past_due, "Task without a due date was incorrectly marked as past due"
  end

end
