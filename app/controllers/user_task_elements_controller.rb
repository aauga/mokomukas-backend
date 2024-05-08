# frozen_string_literal: true

class UserTaskElementsController < ApplicationController
  before_action :authenticate, only: %i[click]

  def index
    render status: :not_found unless user_task.belongs_to?(current_user)

    user_task_elements = UserTaskElement.where(user_task:)

    render json: user_task_elements
  end

  def click
    user_task_element = UserTaskElements::Click.run(current_user, params)

    render json: user_task_element
  end

  private

  def user_task
    @user_task ||= UserTask.find(params[:user_task_id])
  end
end
