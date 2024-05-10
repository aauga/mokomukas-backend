# frozen_string_literal: true

class UserTaskElements::Click
  include Interactor::Initializer

  initialize_with :user_task_element

  delegate :user, to: :user_task_element

  def run
    raise_health_error! unless user.enough_health?
    raise_error! unless user_task_element.updatable?

    user_task_element.clicked!
    award_user

    user_task_element
  end

  private

  def raise_health_error!
    raise Errors::InvalidOperation, 'Not enough health'
  end

  def raise_error!
    raise Errors::InvalidOperation, 'Element already clicked or task has been finished'
  end

  def award_user
    UserTaskElements::AwardUser.run(user_task_element)
  end
end
