# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :id, :template_id, :name, :description
end
