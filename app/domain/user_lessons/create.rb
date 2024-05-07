# frozen_string_literal: true

class UserLessons::Create
  include Interactor::Initializer

  initialize_with :user, :params

  def run
    create_user_task_batch
    user_lesson
  end

  private

  def create_user_task_batch
    UserTasks::CreateBatch.run(user_lesson)
  end

  def user_lesson
    @user_lesson ||= UserLesson.create!(user:, lesson:)
  end

  def lesson
    @lesson ||= Lesson.find(params[:lesson_id])
  end
end