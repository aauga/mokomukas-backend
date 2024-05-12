# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :user_lessons, dependent: :destroy
  has_many :user_tasks, through: :user_lessons
  has_many :user_task_elements, through: :user_tasks
  has_many :user_hints, through: :user_tasks

  validates :username, presence: true, uniqueness: true

  after_save :update_level, if: :saved_change_to_experience_points?

  def can_access_hint?(hint)
    user_hints.find_by(hint:).updatable?
  end

  def update_level
    update(level: experience_points / 100)
  end

  def enough_health?
    health.positive?
  end

  def add_health
    return unless health < 5

    update(health: health + 1, last_health_change_at: Time.zone.now)
  end

  def subtract_health
    return unless health.positive?

    update(health: health - 1, last_health_change_at: Time.zone.now)
  end

  def subtract_money(amount)
    return if amount.negative?
    return unless money >= amount

    update(money: money - amount)
  end
end
