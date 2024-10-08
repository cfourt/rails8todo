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
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
