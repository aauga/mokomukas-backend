# frozen_string_literal: true

class Tasks::ElementsController < ApplicationController
  before_action :authenticate, only: %i[index]

  def index
    task = Task.find(params[:task_id])

    render json: task.task_elements
  end
end
