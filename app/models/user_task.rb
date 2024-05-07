# frozen_string_literal: true

class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  belongs_to :task

  validates :user_id, uniqueness: { scope: %i[lesson_id task_id] }
  validate :task_belongs_to_lesson

  private

  def task_belongs_to_lesson
    return if task.lessons.include?(lesson)

    errors.add(:task, 'does not belong to lesson')
  end
end
