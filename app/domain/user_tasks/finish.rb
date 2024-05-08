# frozen_string_literal: true

class UserTasks::Finish
  include Interactor::Initializer

  initialize_with :user, :params

  def run
    raise_error! unless user_task.updatable?

    user_task.finish!
    finish_user_lesson

    user_task
  end

  private

  def raise_error!
    raise Errors::InvalidOperation, 'Task already finished'
  end

  def user_task
    @user_task ||= UserTask.find_by(task_id: params[:user_task_id])
  end

  def finish_user_lesson
    UserLessons::Finish.run(user_task.user_lesson)
  end
end
