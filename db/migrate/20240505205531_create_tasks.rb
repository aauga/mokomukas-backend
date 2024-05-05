class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :content
      t.integer :lesson_id

      t.timestamps
    end
  end
end
