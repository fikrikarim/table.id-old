class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:upvote, :downvote]

  def home
    @posts = Post.all
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_from current_user

    if request.xhr?
      head :ok
    else
      redirect_to root_path
    end
  end

  def downvote

  end

end
