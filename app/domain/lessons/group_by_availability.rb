# frozen_string_literal: true

class Lessons::GroupByAvailability
  include Interactor::Initializer

  initialize_with :user

  def run
    return { available: lessons } if user.nil?

    {
      available: available_lessons,
      started: started_lessons,
      finished: finished_lessons
    }
  end

  private

  def available_lessons
    ids = user.user_lessons.pluck(:lesson_id)
    lessons.where.not(id: ids)
  end

  def started_lessons
    ids = user.user_lessons.started.pluck(:lesson_id)
    lessons.where(id: ids)
  end

  def finished_lessons
    ids = user.user_lessons.finished.pluck(:lesson_id)
    lessons.where(id: ids)
  end

  def lessons
    @lessons ||= Lesson.where(ended_at: nil)
  end
end
