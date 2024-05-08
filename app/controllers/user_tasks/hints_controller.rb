# frozen_string_literal: true

class UserTasks::HintsController < ApplicationController
  before_action :authenticate, only: %i[index descriptions]

  def index
    render status: :not_found unless user_task.belongs_to?(current_user)

    result = user_task.user_hints

    render json: result
  end

  def descriptions
    render status: :not_found unless user_task.belongs_to?(current_user)

    result = user_task
             .user_hints
             .bought
             .map { |user_hint| user_hint.hint.description }

    render json: result
  end

  private

  def user_task
    @user_task ||= UserTask.find(params[:user_task_id])
  end
end
