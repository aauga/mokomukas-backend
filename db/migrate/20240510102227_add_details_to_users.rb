# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :health, :integer
    add_column :users, :money, :decimal
    add_column :users, :experience_points, :integer
    add_column :users, :level, :integer
    add_column :users, :last_health_restored_at, :datetime
  end
end
