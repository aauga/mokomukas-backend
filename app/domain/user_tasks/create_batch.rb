# frozen_string_literal: true

module UserTasks
  module CreateBatch
    module_function

    def run(user_lesson)
      lesson = user_lesson.lesson

      lesson.tasks.map do |task|
        UserTask.create!(user_lesson:, task:)
        Rails.logger.info("User task created for user_lesson_id: #{user_lesson.id}, task_id: #{task.id}")
      end
    end
  end
end
