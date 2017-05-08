class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def new
    @users = User.new
  end

  def edit
    @users = User.find(params[:id])
  end

  def list
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to :back
  end

  def create
    @users = User.create!(params_user)
    if @users.save
      redirect_to user_profiles_list_path
    else
      p 'hiiiii'
    end
  end

  def update
    @users = User.find(params[:id])
    if @users.update_attributes(params_user)
      redirect_to user_profiles_list_path
    end
  end


  private

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :phone_number, :age)
  end
end
