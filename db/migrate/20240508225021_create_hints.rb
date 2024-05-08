class CreateHints < ActiveRecord::Migration[7.1]
  def change
    create_table :hints do |t|
      t.references :task, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
