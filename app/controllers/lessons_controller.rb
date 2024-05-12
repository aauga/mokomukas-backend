# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate, only: %i[show]

  def show
    render json: Lesson.find(params[:id])
  end

  def available
    grouped_lessons = Lessons::GroupByAvailability.run(current_user)

    render json: grouped_lessons
  end
end
