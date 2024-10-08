json.extract! task, :id, :title, :details, :completed, :completed_at, :due_date, :past_due, :created_at, :updated_at
json.url task_url(task, format: :json)
