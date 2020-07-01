class FriendshipsController < ApplicationController

  def create
    friend = User.find(params[:friend])
    user_friend = current_user.friendships.build(friend_id: friend.id)
    if user_friend.save
      flash.now[:notice] = "#{friend.full_name} add to friend's list"
      redirect_to friendship_path(current_user)
    else
      flash.now[:danger] = "Something went wrong"
      redirect_to users_path
    end
  end

  def show
    @tracked_friends  = current_user.friends.order(:created_at).paginate(page: params[:page], per_page: 10)
  end

end
