class StaticPagesController < ApplicationController

  def home
    if params[:sort_by] == 'Top'
      @posts = Post.order(:sticky, cached_votes_score: "desc").page params[:page]
      @selected = 'Top'
    elsif params[:sort_by] == 'Newest'
      @posts = Post.order(:sticky, created_at: "desc").page params[:page]
      @selected = 'Newest'
    elsif params[:sort_by] == 'Random'
      @posts = Post.order(:sticky, "RANDOM()").page params[:page]
      @selected = 'Random'
    else
      @posts = Post.order(:sticky, trending_score: "desc").page params[:page]
      @selected = 'Trending'
    end
  end

  def upvote
    auth_ajax
    if params[:type] == 'Post'
      object = Post.friendly.find(params[:id])
    else
      object = Comment.find(params[:id])
    end
    object.upvote_from current_user
  end

  # def downvote
  #   auth_ajax
  #   if params[:type] == 'Post'
  #     object = Post.friendly.find(params[:id])
  #   else
  #     object = Comment.find(params[:id])
  #   end
  #   object.downvote_from current_user
  # end

  def osn

  end

  private

  # Because normal authenticate_user! cannot redirect ajax
  def auth_ajax
    if !user_signed_in?
      redirect_to new_user_session_path, notice: 'You need to sign in or sign up before continuing.'
    end
  end

end
