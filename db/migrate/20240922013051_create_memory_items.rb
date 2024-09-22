class CreateMemoryItems < ActiveRecord::Migration[7.2]
  def change
    create_table :memory_items do |t|
      t.string :name, null: false
      t.text :memory, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
