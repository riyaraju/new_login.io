class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  def index

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
