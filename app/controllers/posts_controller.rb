class PostsController < ApplicationController

  def show
    @post = Post.friendly.find(params[:id])
    @comment = Comment.new(post: @post)
  end

  def new
    @post = Post.new(title: "[OSN Story] ")
  end

  def create
    @post = Post.new(posts_params)
    @post.user = current_user
    @post.save
    if @post.save
      flash[:notice] = "Your post has been submitted"
    end
    redirect_to root_path
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text)
  end
end
