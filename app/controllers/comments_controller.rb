class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new(post_id: params[:post_id], parent_id: params[:parent_id])
    @post = Post.find(params[:post_id])
    # byebug
  end

  def create
    @comment = Comment.new(comments_params)
    @post = Post.find(params[:comment][:post_id])
    @comment.user = current_user
    @comment.save
    if @comment.save
      flash[:notice] = "Your comment has been submitted"
    end
    redirect_to post_path(@post)
  end

  private

  def comments_params
    params.require(:comment).permit(:parent_id, :post_id, :text)
  end
end
