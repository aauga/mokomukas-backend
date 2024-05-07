# frozen_string_literal: true

class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :user_id, uniqueness: { scope: :lesson_id }

  enum status: { started: 10, finished: 20 }, _default: :started
end
