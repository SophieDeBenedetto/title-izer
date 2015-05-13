class RegistrationsController < Devise::RegistrationsController

  after_action :update_online_status, only: [:create]

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end


  

  def update_online_status
    user = User.find(current_user.id)
    user.update(status: "online")
  end
  
  
end