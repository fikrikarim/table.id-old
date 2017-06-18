class StaticPagesController < ApplicationController

  def home
    @posts = Post.all.order(cached_votes_score: "desc")
  end

  def upvote
    redirect_to new_user_session_path unless user_signed_in?

    @post = Post.find(params[:id])
    @post.upvote_from current_user

  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_from current_user

  end

end
