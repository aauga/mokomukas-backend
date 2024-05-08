# frozen_string_literal: true

class UserTask < ApplicationRecord
  belongs_to :user_lesson
  belongs_to :task

  has_many :user_task_elements, dependent: :destroy
  has_many :user_hints, dependent: :destroy

  validates :user_lesson_id, uniqueness: { scope: %i[task_id] }
  validate :task_belongs_to_lesson

  enum status: { pending: 10, finished: 20 }, _default: :pending

  def finish!
    update!(status: :finished, finished_at: Time.current) unless finished?
  end

  def belongs_to?(user)
    user_lesson.user == user
  end

  def updatable?
    pending? || user_lesson.updatable?
  end

  private

  def task_belongs_to_lesson
    return if task.lessons.include?(user_lesson.lesson)

    errors.add(:task, 'does not belong to lesson')
  end
end
