class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:edit, :list, :destroy]
  skip_before_filter :verify_authenticity_token
  def index
    if params[:id]
      if current_user.role == 'admin'
        @user = User.find(params[:id])
      else
        redirect_to root_path
      end
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
      @users = User.where(role: nil)
  end

  def destroy
    User.find(params[:id]).destro
    flash[:success] = "User deleted"
    redirect_to :back
  end

  def create
    @users = User.new(params_user)
    if @users.save
      redirect_to user_profiles_list_path
    else
      render 'new'
    end
  end

  def update
    @users = User.find(params[:id])
    if @users.update_attributes(params_user)
      redirect_to user_profiles_list_path
    else
    render 'edit'
    end
  end

  def authenticate_admin!
    unless current_user.role == 'admin'
      redirect_to root_path
    end
  end


  private

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :phone_number, :age)
  end
end
