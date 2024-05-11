# frozen_string_literal: true

class AddStreaksToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :day_streak, :integer, default: 0
  end
end
