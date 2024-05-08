# frozen_string_literal: true

class CreateUserTaskElements < ActiveRecord::Migration[7.1]
  def change
    create_table :user_task_elements do |t|
      t.references :user_task, null: false, foreign_key: true
      t.references :task_element, null: false, foreign_key: true
      t.boolean :clicked
      t.boolean :clicked_correctly
      t.datetime :clicked_at

      t.timestamps
    end

    add_index :user_task_elements, %i[user_task_id task_element_id], unique: true
  end
end
