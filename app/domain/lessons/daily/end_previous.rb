# frozen_string_literal: true

module Lessons::Daily::EndPrevious
  module_function

  def run
    last_daily_lesson = Lesson.all.daily.where(ended_at: nil).last

    return unless last_daily_lesson

    last_daily_lesson.update!(ended_at: Time.current)

    Lessons::Daily::AdjustStreaks.run(last_daily_lesson)
  end
end
