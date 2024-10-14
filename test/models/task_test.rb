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
#  index_tasks_on_due_date  (due_date) WHERE completed = false /*application='Todo'*/ /*application='Todo'*/ /*application='Todo'*/
#  index_tasks_on_user_id   (user_id)
#
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
