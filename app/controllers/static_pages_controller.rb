class StaticPagesController < ApplicationController

  def home
    @post = Post.first
  end

end
