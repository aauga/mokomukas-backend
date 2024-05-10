# frozen_string_literal: true

class UserTaskElement < ApplicationRecord
  belongs_to :user_task
  belongs_to :task_element

  validates :user_task, uniqueness: { scope: :task_element }

  def user
    user_task.user_lesson.user
  end

  def clicked!
    update!(
      clicked: true,
      clicked_correctly: task_element.correct,
      clicked_at: Time.current
    )
  end

  def updatable?
    clicked_at? || user_task.updatable?
  end

  def belongs_to?(user)
    user_task.user_lesson.user == user
  end
end
