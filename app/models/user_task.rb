# frozen_string_literal: true

class UserTask < ApplicationRecord
  belongs_to :user_lesson
  belongs_to :task

  validates :user_lesson_id, uniqueness: { scope: %i[task_id] }
  validate :task_belongs_to_lesson

  enum status: { pending: 10, finished: 20 }, _default: :pending

  def finish!
    update!(finished_at: Time.current) unless finished?
  end

  private

  def task_belongs_to_lesson
    return if task.lessons.include?(user_lesson.lesson)

    errors.add(:task, 'does not belong to lesson')
  end
end
