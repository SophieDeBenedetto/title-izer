class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  before_action :update_last_seen
  
  
  def update_last_seen
    current_user.update(last_seen: Time.now) if current_user
  end

  helper_method :update_last_seen



end
