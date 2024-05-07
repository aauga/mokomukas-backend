# frozen_string_literal: true

class CreateUserTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :user_tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.boolean :correct
      t.date :answered_at

      t.timestamps
    end

    add_index :user_tasks, %i[user_id lesson_id task_id], unique: true
  end
end
