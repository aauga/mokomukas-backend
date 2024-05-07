# frozen_string_literal: true

class UserTask < ApplicationRecord
  belongs_to :user_lesson
  belongs_to :task

  validates :user_lesson_id, uniqueness: { scope: %i[task_id] }
  validate :task_belongs_to_lesson

  enum status: { pending: 10, correct: 20, incorrect: 30 }, _default: :pending

  private

  def task_belongs_to_lesson
    return if task.lessons.include?(user_lesson.lesson)

    errors.add(:task, 'does not belong to lesson')
  end
end
