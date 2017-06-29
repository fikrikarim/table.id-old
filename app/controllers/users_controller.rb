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

  def update
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end

    if @user.update_attributes(profile_params)
      flash[:notice] = "Your profile has been updated"
      redirect_to user_profile_path(@user.username)
    else
      flash[:notice] = "The username has been taken"
      redirect_to edit_profile_path(current_user.username)
    end

  end

  private

  def profile_params
    params.require(:user).permit(:full_name, :username, :facebook, :twitter, :instagram, :bio)
  end
end
