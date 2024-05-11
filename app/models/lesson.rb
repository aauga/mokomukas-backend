# frozen_string_literal: true

class Lesson < ApplicationRecord
  TYPE_REGULAR = 'regular'
  TYPE_DAILY = 'daily'

  enum lesson_type: { TYPE_REGULAR: 0, TYPE_DAILY: 1 }.default(:TYPE_REGULAR)

  has_and_belongs_to_many :tasks
  has_many :user_lessons, dependent: :destroy
end
