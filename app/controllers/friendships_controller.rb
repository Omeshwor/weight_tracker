class FriendshipsController < ApplicationController

  def create
    friend = User.find(params[:friend])
    user_friend = current_user.friendships.build(friend_id: friend.id)
    if user_friend.save
      flash.now[:notice] = "#{friend.full_name} add to friend's list"
      redirect_to users_path
    else
      flash.now[:danger] = "Something went wrong"
      redirect_to users_path
    end
  end

end
