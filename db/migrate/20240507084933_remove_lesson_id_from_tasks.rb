# frozen_string_literal: true

class RemoveLessonIdFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :lesson_id, :integer
  end
end
