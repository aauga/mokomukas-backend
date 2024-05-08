# frozen_string_literal: true

class UserHintSerializer < ActiveModel::Serializer
  attributes :id, :user_task_id, :hint_id, :bought
end
