class MemoryItem < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :memory, presence: true, length: { maximum: 535 }

  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :memory_item_image, MemoryItemImageUploader
end
