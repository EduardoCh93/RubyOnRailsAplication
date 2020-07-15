module FollowsConcern
  def followings
    @title = 'Siguiendo'
    @user = User.find(params[:id])
    @users = @user.followings.map{ |f| User.find(f.id_usuario) }
    render 'show_follow'
  end

  def followers
    @title = 'Seguidores'
    @user = User.find(params[:id])
    @users = @user.followers.map{ |f| User.find(f.id_usuario) }
    render 'show_follow'
  end
end
