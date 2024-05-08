# frozen_string_literal: true

class UserTaskElementsController < ApplicationController
  before_action :authenticate, only: %i[click]

  def click
    render status: :not_found unless user_task_element.belongs_to?(current_user)

    result = UserTaskElements::Click.run(user_task_element)

    render json: result
  end

  private

  def user_task_element
    @user_task_element ||= UserTaskElement.find(params[:user_task_element_id])
  end
end
