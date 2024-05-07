# frozen_string_literal: true

class CreateJoinTableLessonTask < ActiveRecord::Migration[7.1]
  def change
    create_join_table :lessons, :tasks do |t|
      t.index %i[lesson_id task_id]
      t.index %i[task_id lesson_id]
    end
  end
end
