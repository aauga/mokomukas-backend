# frozen_string_literal: true

module UserTaskElements::AwardUser
  module_function

  def run(user_task_element)
    user = user_task_element.user

    return user.subtract_health unless user_task_element.clicked_correctly?

    user.money += 100
    user.experience_points += 25
    user.save!
  end
end
