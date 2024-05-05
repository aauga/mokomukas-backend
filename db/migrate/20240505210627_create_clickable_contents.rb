class CreateClickableContents < ActiveRecord::Migration[7.1]
  def change
    create_table :clickable_contents do |t|
      t.text :content_code
      t.references :task, null: false, foreign_key: true
      t.boolean :correct

      t.timestamps
    end
  end
end
