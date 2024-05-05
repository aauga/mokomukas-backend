class CreateClickableContents < ActiveRecord::Migration[7.1]
  def change
    create_table :clickable_contents do |t|
      t.string :content_code
      t.integer :task_id

      t.timestamps
    end
  end
end
