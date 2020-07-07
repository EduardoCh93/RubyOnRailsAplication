class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:sucess] = 'Bienvenido al foro'
      redirect_to @user
    else
      render 'new'
    end
  end
end
