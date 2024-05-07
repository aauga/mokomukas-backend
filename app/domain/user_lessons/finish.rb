# frozen_string_literal: true

module UserLessons::Finish
  module_function

  def run(user_lesson)
    user_lesson.finish! if user_lesson.pending_user_tasks.empty?
    user_lesson
  end
end

