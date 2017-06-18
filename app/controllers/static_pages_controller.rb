class StaticPagesController < ApplicationController

  def home
    @posts = Post.all.order(cached_votes_score: "desc")
  end

  def upvote
    auth_ajax
    @post = Post.find(params[:id])
    @post.upvote_from current_user

  end

  def downvote
    auth_ajax
    @post = Post.find(params[:id])
    @post.downvote_from current_user

  end

  private

  # Because normal authenticate_user! cannot redirect ajax
  def auth_ajax
    if !user_signed_in?
      redirect_to new_user_session_path, notice: 'You need to sign in or sign up before continuing.'
    end
  end

end
