# frozen_string_literal: true

class UserTasksController < ApplicationController
  before_action :authenticate, only: %i[statistics finish]

  def statistics
    render status: :not_found unless user_task.belongs_to?(current_user)

    result = UserTasks::FetchStatistics.run(user_task)

    render json: result
  end

  def finish
    render status: :not_found unless user_task.belongs_to?(current_user)

    result = UserTasks::Finish.run(user_task)

    render json: result
  end

  private

  def user_task
    @user_task ||= UserTask.find(params[:user_task_id])
  end
end
