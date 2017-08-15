class PostsController < ApplicationController

  def show
    @post = Post.friendly.find(params[:id])
    @comment = Comment.new(post: @post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)

    if @post.link.present? && !@post.link.include?('http')
      @post.link = 'http://' + @post.link
    end

    # Check for valid uri
    if @post.link.present? && !uri?(@post.link)
      flash[:notice] = "Link yang anda masukkan tidak valid."
      render 'new'
    else
      @post.user = current_user
      if @post.user.admin == true
        @post.sticky = true
      end
      @post.save
      if @post.save
        flash[:notice] = "Your post has been submitted"
      end
      redirect_to root_path
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
    if @post.user != current_user
      redirect_to root_path
    end
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.user != current_user
      redirect_to root_path
    end
    if @post.update_attributes(posts_params)
      flash[:notice] = "Your post has been edited"
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.friendly.find(params[:id])

    if current_user.admin == true
      @post.destroy
      flash[:notice] = "The post has been deleted"
    end

    redirect_to root_path
  end

  def report
    flash[:notice] = "We are reviewing your report. Thanks for making table.id more awesome!"
    redirect_to root_path
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text, :link)
  end
end
