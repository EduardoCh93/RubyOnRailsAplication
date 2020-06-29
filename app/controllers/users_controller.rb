class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to home_path
    else
      render 'new'
    end
  end
end
