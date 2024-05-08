# frozen_string_literal: true

class UserTasksController < ApplicationController
  before_action :authenticate, only: %i[finish]

  def finish
    render status: :not_found unless user_task.belongs_to?(current_user)

    user_task = UserTasks::Finish.run(current_user, params)

    render json: user_task
  end

  private

  def user_task
    @user_task ||= UserTask.find(task_id: params[:user_task_id])
  end
end
