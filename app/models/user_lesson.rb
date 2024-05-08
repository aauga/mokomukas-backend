# frozen_string_literal: true

class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  has_many :user_tasks, dependent: :destroy

  validates :user_id, uniqueness: { scope: :lesson_id }

  enum status: { started: 10, finished: 20 }, _default: :started

  def pending_user_tasks
    user_tasks.pending
  end

  def finish!
    update!(status: :finished, finished_at: Time.current) unless finished?
  end

  def updatable?
    started?
  end
end
