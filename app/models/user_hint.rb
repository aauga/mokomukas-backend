# frozen_string_literal: true

class UserHint < ApplicationRecord
  belongs_to :hint
  belongs_to :user_task

  validates :user_task, uniqueness: { scope: :hint }
  validate :same_task_id

  delegate :belongs_to?, to: :user_task

  scope :bought, -> { where(bought: true).where.not(bought_at: nil) }
  scope :buyable, -> { where(bought: [nil, false], bought_at: nil) }

  def updatable?
    !bought || user_task.updatable?
  end

  def bought!
    update!(bought: true, bought_at: Time.zone.now) if updatable?
  end

  private

  def same_task_id
    return if user_task.task_id == hint.task_id

    errors.add(:base, 'UserTask and Hint must belong to the same task')
  end
end
