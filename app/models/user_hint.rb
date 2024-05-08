# frozen_string_literal: true

class UserHint < ApplicationRecord
  belongs_to :hint
  belongs_to :user_task

  validates :user_task, uniqueness: { scope: :hint }
  validate :same_task_id

  private

  def same_task_id
    return if user_task.task_id == hint.task_id

    errors.add(:base, 'UserTask and Hint must belong to the same task')
  end
end
