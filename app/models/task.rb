# frozen_string_literal: true

class Task < ApplicationRecord
  has_and_belongs_to_many :lessons
  has_many :task_elements, dependent: :destroy
end
