# frozen_string_literal: true

module UserTaskElements::AwardUser
  module_function

  def run(user_task_element)
    user = user_task_element.user

    return user.subtract_health unless user_task_element.clicked_correctly?

    user.money += UserAwards::MONEY
    user.experience_points += UserAwards::EXPERIENCE_POINTS
    user.save!
  end
end
