class UsersController < ApplicationController

  def show 
  end

  def my_portfolio
    @user_stocks = current_user.stocks
    @user = current_user
  end

  def my_friends
    @friendships = current_user.friends
  end

  def search
    @users = User.search(params[:search_param])

    if @users = current_user.expect_current_user(@users)
      render partial: 'friends/lookup'
    else
      head :not_found
    end
  end

  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)
    
    if current_user.save
      redirect_to my_friends_path
      flash[:notice] =  "Friend was successfully added"
    else
      redirect_to my_friends_path
      flash[:error] ="There was an error with adding user as friend"
    end
  end

end