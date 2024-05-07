# frozen_string_literal: true

class UserTasksController < ApplicationController
  before_action :authenticate, only: %i[finish]

  def finish
    user_task = UserTasks::Finish.run(current_user, params)

    render json: user_task
  end
end
