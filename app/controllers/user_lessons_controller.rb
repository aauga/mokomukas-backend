# frozen_string_literal: true

class UserLessonsController < ApplicationController
  before_action :authenticate, only: %i[index create]

  def index
    user_lesson = UserLesson.find_by(user_id: current_user.id, lesson_id: params[:lesson_id])

    if user_lesson
      render json: user_lesson, include: :pending_user_tasks
    else
      render status: :not_found
    end
  end

  def create
    user_lesson = UserLessons::Create.run(current_user, user_lesson_params)

    render json: user_lesson
  end

  private

  def user_lesson_params
    params.require(:user_lesson).permit(:lesson_id)
  end
end
