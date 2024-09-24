class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to memory_item_path(comment.memory_item), success: t('defaults.flash_message.created', item: Comment.model_name.human)
    else
      redirect_to memory_item_path(comment.memory_item), danger: t('defaults.flash_message.not_created', item: Comment.model_name.human)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(memory_item_id: params[:memory_item_id])
  end
end