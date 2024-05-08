# frozen_string_literal: true

class UserTaskElementSerializer < ActiveModel::Serializer
  attributes :id, :user_task_id, :task_element_id, :status
end
