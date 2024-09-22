class MemoryItem < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :memory, presence: true, length: { maximum: 535 }

  belongs_to :user
end
