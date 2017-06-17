class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:upvote, :downvote]

  def home
    @posts = Post.all.order(cached_votes_score: "desc")
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_from current_user

    if request.xhr?
      render json: { id: params[:id] }
    end
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_from current_user

    if request.xhr?
      head :ok
    end
  end

end
