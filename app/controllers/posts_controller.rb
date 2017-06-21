class PostsController < ApplicationController

  def show
    @post = Post.friendly.find(params[:id])
    @comment = Comment.new(post: @post)
  end
end
