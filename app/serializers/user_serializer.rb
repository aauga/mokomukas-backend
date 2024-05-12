# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :day_streak, :health, :money, :level, :created_at, :updated_at
end
