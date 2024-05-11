# frozen_string_literal: true

class Lessons::Daily::Create
  include Interactor::Initializer

  def run
    return if lesson_created_today?

    Lessons::Daily::EndPrevious.run

    daily_lesson
  end

  private

  def lesson_created_today?
    daily_lessons.find_by(created_at: Date.current.beginning_of_day..Date.current.end_of_day)
  end

  def daily_lesson
    Lesson.create!(
      lesson_type: :daily,
      name: "Dienos užduotis ##{daily_lessons.count + 1}",
      tasks: [Task.all.sample]
    )
  end

  def daily_lessons
    @daily_lessons ||= Lesson.all.daily
  end
end
