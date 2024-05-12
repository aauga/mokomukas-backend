# frozen_string_literal: true

class UserTasks::Finish
  include Interactor::Initializer

  initialize_with :user_task

  delegate :user_lesson, to: :user_task
  delegate :user, to: :user_lesson

  def run
    raise_health_error! unless user.enough_health?
    raise_error! unless user_task.updatable?

    reduce_health
    user_task.finish!
    finish_user_lesson

    user_task
  end

  private

  def raise_health_error!
    raise Errors::InvalidOperation, 'Not enough health'
  end

  def raise_error!
    raise Errors::InvalidOperation, 'Task already finished'
  end

  def reduce_health
    not_clicked_task_elements = user_task.user_task_elements.where(clicked_at: nil)

    not_clicked_task_elements.each do |user_task_element|
      user.subtract_health if user_task_element.task_element.correct?
    end
  end

  def finish_user_lesson
    UserLessons::Finish.run(user_lesson)
  end
end
