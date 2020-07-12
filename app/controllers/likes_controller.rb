class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @repost = current_user.likes.build(like_params)
    if @repost.save
      flash[:success] = "Post liked"
      redirect_to request.referrer
    else
      render 'static_pages/home'
    end
  end

  def destroy
    Like.destroy(params[:id])
    flash[:success] = "Post unliked"
    redirect_to request.referrer
  end

  private

  def like_params
    params.permit(:post_id)
  end
end
