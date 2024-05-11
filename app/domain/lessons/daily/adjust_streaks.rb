# frozen_string_literal: true

module Lessons::Daily::AdjustStreaks
  def run(lesson)
    raise_error! unless lesson.daily?

    finished_users = lesson.user_lessons.finished.map(&:user)
    finished_users.each { |user| user.update!(day_streak: user.day_streak + 1) }

    unfinished_users = User.all.where.not(id: finished_users.pluck(:id))
    unfinished_users.each { |user| user.update!(day_streak: 0) }
  end

  module_function :run

  def raise_error!
    raise ArgumentError, 'Lesson should be daily'
  end
end
