# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_and_belongs_to_many :tasks
end
