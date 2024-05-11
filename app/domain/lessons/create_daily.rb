# frozen_string_literal: true

class Lessons::CreateDaily
  include Interactor::Initializer

  def run
    return if daily_lesson_exists?

    end_previous_daily_lessons
    create_daily_lesson
  end

  private

  def daily_lesson_exists?
    daily_lessons.find_by(created_at: Date.current.beginning_of_day..Date.current.end_of_day)
  end

  def end_previous_daily_lessons
    daily_lessons.where(ended_at: nil).find_each { |lesson| lesson.update!(ended_at: Time.current) }
  end

  def create_daily_lesson
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
