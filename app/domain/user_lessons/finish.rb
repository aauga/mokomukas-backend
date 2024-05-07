# frozen_string_literal: true

module UserLessons::Finish
  module_function

  def run(user_lesson)
    return if user_lesson.finished?
    return if user_lesson.pending_user_tasks.empty?

    user_lesson.finish!
  end
end

