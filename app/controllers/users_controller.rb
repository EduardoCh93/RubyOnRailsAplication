class UsersController < ApplicationController
  include FollowsConcern

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @reposts = @user.reposts
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
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

  def all
    @user = User.all
  end

  def users_list
    all
  end

  def search
    all
  end

  def forgot_password
    @user = User.find_by_email(params[:email])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
