# frozen_string_literal: true

class UserTaskElement < ApplicationRecord
  belongs_to :user_task
  belongs_to :task_element

  enum status: { pending: 10, clicked: 20 }, _default: :pending

  def clicked!
    update!(status: :clicked, clicked_at: Time.current) unless clicked?
  end
end
