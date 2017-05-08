class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def edit
  end

  def list
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to :back

  end
end
