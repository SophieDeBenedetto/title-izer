class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :update_last_seen
  
  #show who is active, logged on, logged off
  #show appropriate avatar
  #dual log in
  #invite a friend
  #deploy
  #upload avatars/set up amazon bucket

  def update_last_seen
    current_user.update(last_seen: Time.now) if current_user
  end

  helper_method :update_last_seen
 

end
