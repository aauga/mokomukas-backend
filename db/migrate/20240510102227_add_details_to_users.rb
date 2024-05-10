# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :health, :integer, default: 0
    add_column :users, :money, :decimal, default: 0
    add_column :users, :experience_points, :integer, default: 0
    add_column :users, :level, :integer, default: 0
    add_column :users, :last_health_change_at, :datetime, default: Time.zone.at(0)
  end
end
