# frozen_string_literal: true

class Hint < ApplicationRecord
  belongs_to :task

  has_many :user_hints, dependent: :destroy
end
