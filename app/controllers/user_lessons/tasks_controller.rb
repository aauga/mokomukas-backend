# frozen_string_literal: true

class UserLessons::TasksController < ApplicationController
  before_action :authenticate, only: %i[index]

  def index
    render status: :not_found unless user_lesson.belongs_to?(current_user)

    user_tasks = UserTask.where(user_lesson:)

    render json: user_tasks
  end

  private

  def user_lesson
    @user_lesson ||= UserLesson.find(params[:user_lesson_id])
  end
end
