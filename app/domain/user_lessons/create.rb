# frozen_string_literal: true

class UserLessons::Create
  include Interactor::Initializer

  initialize_with :user, :lesson

  def run
    create_user_task_batch
    create_user_task_element_batch
    user_lesson
  end

  private

  def create_user_task_batch
    UserTasks::CreateBatch.run(user_lesson)
  end

  def create_user_task_element_batch
    user_tasks.each { |user_task| UserTaskElements::CreateBatch.run(user_task) }
  end

  def user_lesson
    @user_lesson ||= UserLesson.create!(user:, lesson:)
  end

  def user_tasks
    @user_tasks ||= UserTask.where(user_lesson:, status: :pending)
  end
end
