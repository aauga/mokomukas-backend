# frozen_string_literal: true

class UserTaskElements::Click
  include Interactor::Initializer

  initialize_with :user, :params

  def run
    raise_forbidden_error! unless task_belongs_to_user?
    raise_error! if invalid_operation?

    user_task_element.clicked!

    user_task_element
  end

  private

  def raise_forbidden_error!
    raise Errors::ForbiddenAccess
  end

  def task_belongs_to_user?
    user_task_element.user_task.user_lesson.user_id == user.id
  end

  def raise_error!
    raise Errors::InvalidOperation, 'Element already clicked or task has been finished'
  end

  def invalid_operation?
    user_task_element.clicked? ||
      user_task_element.user_task.finished? ||
      user_task_element.user_task.user_lesson.finished?
  end

  def user_task_element
    @user_task_element ||= UserTaskElement.find_by(id: params[:task_element_id])
  end
end
