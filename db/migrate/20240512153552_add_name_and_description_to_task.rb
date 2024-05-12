# frozen_string_literal: true

class AddNameAndDescriptionToTask < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :name, :string
    add_column :tasks, :description, :string
  end
end
