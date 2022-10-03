class Users::RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:user).permit :user_name, :email, :password, :password_confirmation
  end
end
