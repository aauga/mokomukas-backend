# frozen_string_literal: true

module UserTaskElements::CreateBatch
  def run(user_task)
    task_elements = user_task.task.task_elements
    task_elements.each do |task_element|
      UserTaskElement.create!(user_task:, task_element:)
    end
  end
end
