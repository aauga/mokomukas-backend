# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate, only: %i[show]

  def show
    task = Task.find(params[:id])

    render json: task
  end
end
