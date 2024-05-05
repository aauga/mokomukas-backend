# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :lesson
  has_many :clickable_contents, dependent: :destroy
end
