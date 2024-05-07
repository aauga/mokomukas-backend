# frozen_string_literal: true

class LessonsController < ApplicationController
  def index
    grouped_lessons = Lessons::GroupByAvailability.run(current_user)

    render json: grouped_lessons
  end
end
