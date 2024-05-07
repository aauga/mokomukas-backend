# frozen_string_literal: true

class CreateUserTaskElements < ActiveRecord::Migration[7.1]
  def change
    create_table :user_task_elements do |t|
      t.references :user_task, null: false, foreign_key: true
      t.references :task_element, null: false, foreign_key: true
      t.integer :status
      t.datetime :clicked_at

      t.timestamps
    end
  end
end
