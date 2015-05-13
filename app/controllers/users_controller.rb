class UsersController < ApplicationController
  def index
  end

  def games
    binding.pry
    @users = User.all
    @conversation = Conversation.new
  end
end
