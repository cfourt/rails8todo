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
class Task < ApplicationRecord
  # TODO - https://edgeguides.rubyonrails.org/active_storage_overview.html for image-uploads
  belongs_to :user
  validates :user, presence: true

  has_rich_text :details
  after_validation :update_past_due, if: ->(task) { task.due_date }
  after_validation :set_completed_at, if: :completed?

  scope :order_by_completion, -> {
    order(Arel.sql("CASE WHEN completed IS NULL THEN 0 ELSE 1 END, completed DESC"))
  }

  scope :order_by_due_date, -> {
    order(Arel.sql("CASE WHEN due_date IS NULL THEN 1 ELSE 0 END, due_date ASC"))
  }

  scope :priority_order, -> {order_by_completion.order_by_due_date}

  # TODO
  def complete!
    # toggle boolean
    # set completed_at
  end

  def past_due?
    self.past_due == true || self.should_be_past_due?
  end

  # TODO should_be_past_due? should probably be combined with update_past_due. consider the after_validation
  def should_be_past_due?
    return false if self.due_date.nil?
    return false unless self.due_date < DateTime.current
    self.past_due = true
    true
  end

  def update_past_due
    self.past_due = true if self.due_date <= Time.now
  end

  private
  def set_completed_at
    self.completed_at = Time.now
  end
end
