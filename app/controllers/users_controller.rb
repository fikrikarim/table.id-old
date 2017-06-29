class UsersController < ApplicationController

  def show
    @user = User.find_by username: params[:username]
  end

  def edit
    @user = User.find_by username: params[:username]
    if @user != current_user
      redirect_to root_path
    else

    end
  end
end
