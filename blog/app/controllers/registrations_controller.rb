class RegistrationsController < Devise::RegistrationsController

  private

  # Defines the parameters Devise gets during sign-up
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # Defines the parameters Devise gets during account editing
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
