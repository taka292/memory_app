class MemoryItemsController < ApplicationController
def index
  @memory_items = MemoryItem.includes(:user)
end
end
