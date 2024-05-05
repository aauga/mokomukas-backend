# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
