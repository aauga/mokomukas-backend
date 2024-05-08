# frozen_string_literal: true

class UserTaskElements::Click
  include Interactor::Initializer

  initialize_with :user_task_element

  def run
    raise_error! unless user_task_element.updatable?

    user_task_element.clicked!
    user_task_element
  end

  private

  def raise_error!
    raise Errors::InvalidOperation, 'Element already clicked or task has been finished'
  end
end
