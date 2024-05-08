# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :user_lessons, dependent: :destroy
  has_many :user_tasks, through: :user_lessons
  has_many :user_task_elements, through: :user_tasks
  has_many :user_hints, through: :user_tasks

  validates :username, presence: true, uniqueness: true

  def can_access_hint?(hint)
    user_hints.find_by(hint:).updatable?
  end
end
