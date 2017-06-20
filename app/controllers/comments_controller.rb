class CommentsController < ApplicationController

  def new
    @comment = Comment.new(post_id: params[:post_id], parent_id: params[:parent_id])
    byebug
  end
end
