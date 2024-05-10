# frozen_string_literal: true

module UserTaskElements::AwardUser
  def run(user_task_element)
    return unless user_task_element.clicked_correctly?

    user = user_task_element.user_task.user

    user.money += 100
    user.experience_points += 25

    user.save!
  end
end
