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
    if current_user.sign_in_count == 1 && current_user.avatar.nil?
      render "avatar"
    end
  end


end
