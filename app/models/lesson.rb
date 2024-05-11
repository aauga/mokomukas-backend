# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_and_belongs_to_many :tasks
  has_many :user_lessons, dependent: :destroy

  enum lesson_type: { regular: 10, daily: 20 }, _default: :regular
end
