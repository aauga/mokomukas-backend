class CreateUserHints < ActiveRecord::Migration[7.1]
  def change
    create_table :user_hints do |t|
      t.references :user_task, null: false, foreign_key: true
      t.references :hint, null: false, foreign_key: true
      t.boolean :bought
      t.datetime :bought_at

      t.timestamps
    end
  end
end
