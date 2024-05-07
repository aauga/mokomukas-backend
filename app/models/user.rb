# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :user_lessons, dependent: :destroy
end
