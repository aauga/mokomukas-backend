# frozen_string_literal: true

class CreateUserTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :user_tasks do |t|
      t.references :user_lesson, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.integer :status
      t.date :answered_at

      t.timestamps
    end

    add_index :user_tasks, %i[user_lesson_id task_id], unique: true
  end
end
