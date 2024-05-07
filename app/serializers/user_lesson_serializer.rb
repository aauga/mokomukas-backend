# frozen_string_literal: true

class UserLessonSerializer < ActiveModel::Serializer
  attributes :id, :status, :pending_user_tasks, :created_at

  def pending_user_tasks
    object.pending_user_tasks.map do |task|
      UserTaskSerializer.new(task).attributes
    end
  end
end
