# frozen_string_literal: true

class UserTasks::ElementsController < ApplicationController
  before_action :authenticate, only: %i[index]

  def index
    render status: :not_found unless user_task.belongs_to?(current_user)

    user_task_elements = UserTaskElement.where(user_task:)

    render json: user_task_elements
  end

  private

  def user_task
    @user_task ||= UserTask.find(params[:user_task_id])
  end
end
