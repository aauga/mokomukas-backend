# frozen_string_literal: true

class LessonSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
end
