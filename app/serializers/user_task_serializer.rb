# frozen_string_literal: true

class UserTaskSerializer < ActiveModel::Serializer
  attributes :id, :task_id, :status
end
