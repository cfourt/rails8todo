module TasksHelper
  def formatted_title(task)
    formatted_title = case
                      when task.completed? == true
                        content_tag(:strike, task.title)
                      when task.past_due? || task.should_be_past_due? == true
                        "#{task.title}".html_safe +
                          content_tag(:span, "Past Due", class: "inline-flex items-center rounded-md bg-yellow-50 ml-2 align-middle px-2 py-1 text-xs font-medium text-yellow-800 ring-1 ring-inset ring-yellow-600/20")
                      else
                        task.title
                      end

    formatted_title
  end

  def formatted_due_date(task)
    return if task.due_date.blank?
    time_string = time_ago_in_words(task.due_date)
    task.past_due? ? "#{time_string} ago" : "in #{time_string}"
  end
end
