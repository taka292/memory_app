class AddMemoryItemImageToMemoryItems < ActiveRecord::Migration[7.2]
  def change
    add_column :memory_items, :memory_item_image, :string
  end
end
