# frozen_string_literal: true

module Lessons::Daily::EndPrevious
  module_function

  def run
    active_daily_lessons = Lesson.all.daily.where(ended_at: nil)
    active_daily_lessons.find_each { |lesson| lesson.update!(ended_at: Time.current) }
  end
end
