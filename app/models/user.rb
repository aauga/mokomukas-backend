# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :user_lessons, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  def started_lessons
    user_lessons.started
  end

  def finished_lessons
    user_lessons.finished
  end
end
