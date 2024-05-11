# frozen_string_literal: true

class AddDetailsToLesson < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :lesson_type, :integer
    add_column :lessons, :ended_at, :datetime
  end
end
