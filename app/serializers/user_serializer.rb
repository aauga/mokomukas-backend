# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :money, :level, :created_at, :updated_at
end
