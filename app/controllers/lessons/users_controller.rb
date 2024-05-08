# frozen_string_literal: true

class Lessons::UsersController < ApplicationController
  before_action :authenticate, only: %i[index create]

  def index
    user_lesson = UserLesson.find_by(user: current_user, lesson:)

    render json: user_lesson, include: :pending_user_tasks
  end

  def create
    user_lesson = UserLessons::Create.run(current_user, lesson)

    render json: user_lesson
  end

  private

  def lesson
    @lesson ||= Lesson.find(params[:lesson_id])
  end
end
