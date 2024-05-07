# frozen_string_literal: true

class UserTasks::Finish
  include Interactor::Initializer

  initialize_with :user, :params

  def run
    raise_forbidden_error! unless task_belongs_to_user?
    raise_answered_error! if user_task.finished?

    user_task.finish!

    user_task
  end

  private

  def raise_forbidden_error!
    raise Errors::ForbiddenAccess
  end

  def raise_answered_error!
    raise Errors::TaskAlreadyFinished, 'Task already finished'
  end

  def task_belongs_to_user?
    user_task.user_lesson.user_id == user.id
  end

  def user_task
    @user_task ||= UserTask.find(params[:id])
  end
end
