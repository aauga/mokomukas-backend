# frozen_string_literal: true

class CreateTaskElements < ActiveRecord::Migration[7.1]
  def change
    create_table :task_elements do |t|
      t.references :task, null: false, foreign_key: true
      t.string :external_code
      t.boolean :correct

      t.timestamps
    end
  end
end
