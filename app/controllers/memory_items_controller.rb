class MemoryItemsController < ApplicationController
  def new
    @memory_item = MemoryItem.new
  end

  def index
    @memory_items = MemoryItem.includes(:user)
  end

  def create
    @memory_item = current_user.memory_items.build(memory_item_params)
    if @memory_item.save
      redirect_to memory_items_path, success: "思い出のモノを登録しました"
    else
      flash.now[:danger] = "登録できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @memory_item = MemoryItem.find(params[:id])
    @comment = Comment.new
    @comments = @memory_item.comments.includes(:user).order(created_at: :desc)
  end

  private

  def memory_item_params
    params.require(:memory_item).permit(:name, :memory,:memory_item_image, :memory_item_image_cache)
  end
end
