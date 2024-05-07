# frozen_string_literal: true

class UserTaskElementsController < ApplicationController
  before_action :authenticate, only: %i[click]

  def click
    user_task_element = UserTaskElements::Click.run(current_user, params)

    render json: user_task_element
  end
end
