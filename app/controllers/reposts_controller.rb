class RepostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @repost = current_user.reposts.build(repost_params)
    if @repost.save
      flash[:success] = "Repost creado!"
      redirect_to request.referrer
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

  def repost_params
    params.permit(:post_id)
  end
end
