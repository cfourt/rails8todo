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
class Task < ApplicationRecord
    # TODO - https://edgeguides.rubyonrails.org/active_storage_overview.html for image-uploads
    has_rich_text :details
    after_validation :update_past_due, if: ->(task) {task.due_date} 

    def update_past_due
      self.past_due = true if self.due_date <= Time.now
    end
end
