# frozen_string_literal: true

class UserHintSerializer < ActiveModel::Serializer
  attributes :id, :hint_id, :bought

  def hint
    HintSerializer.new(object.hint).attributes
  end
end
