# frozen_string_literal: true

class CreateUserLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :user_lessons do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.integer :status
      t.date :finished_at

      t.timestamps
    end

    add_index :user_lessons, %i[user_id lesson_id], unique: true
  end
end
