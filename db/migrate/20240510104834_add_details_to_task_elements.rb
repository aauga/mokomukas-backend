# frozen_string_literal: true

class AddDetailsToTaskElements < ActiveRecord::Migration[7.1]
  def change
    add_column :task_elements, :money, :decimal
    add_column :task_elements, :experience_points, :integer
  end
end
