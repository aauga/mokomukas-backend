# frozen_string_literal: true

class UserTasksController < ApplicationController
  before_action :authenticate, only: %i[index finish]

  def index
    render status: :not_found unless user_lesson.belongs_to?(current_user)

    user_tasks = UserTask.where(user_lesson:)

    render json: user_tasks
  end

  def finish
    render status: :not_found unless user_task.belongs_to?(current_user)

    user_task = UserTasks::Finish.run(current_user, params)

    render json: user_task
  end

  private

  def user_lesson
    @user_lesson ||= UserLesson.find(params[:user_lesson_id])
  end

  def user_task
    @user_task ||= UserTask.find(task_id: params[:task_id])
  end
end
