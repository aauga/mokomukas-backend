# frozen_string_literal: true

class UserLessonsController < ApplicationController
  before_action :authenticate, only: %i[show create]

  def show
    user_lesson = UserLesson.find_by(user_id: current_user.id, lesson_id: params[:lesson_id])

    if user_lesson
      render json: user_lesson, include: :pending_user_tasks
    else
      render status: :not_found
    end
  end

  def create
    user_lesson = UserLessons::Create.run(current_user, params)

    render json: user_lesson
  end
end
