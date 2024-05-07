# frozen_string_literal: true

class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  has_many :user_tasks, dependent: :nullify

  validates :user_id, uniqueness: { scope: :lesson_id }

  enum status: { started: 10, finished: 20 }, _default: :started
end
