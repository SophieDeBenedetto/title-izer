class UsersController < ApplicationController

  before_action :avatarize, only: [:index]

  def index
  end

  # def update
  #   binding.pry
  # end

  def games
    @users = User.all
    @conversation = Conversation.new
  end

  def avatarize
    @user = current_user
    if current_user.sign_in_count == 1 && (current_user.avatar == "http://avatarmaker.net/free-avatars/avatars/various_227/yellow_duck_avatar_100x100_48557.jpg" || current_user.avatar == "http://robohash.org/my-own-slug.jpg?size=100x100")
      render "avatar"
    end
  end


end
