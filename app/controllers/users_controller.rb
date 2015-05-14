class UsersController < ApplicationController
  def index
  end

  def games
    @users = User.all
    @conversation = Conversation.new
  end

  
end
