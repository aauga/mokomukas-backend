# frozen_string_literal: true

class LessonsController < ApplicationController
  def index
    render json: Lesson.all
  end
end
