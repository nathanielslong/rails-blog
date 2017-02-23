class RegistrationsController < Devise::RegistrationsController

  # def show
  #   @user = User.find(params[:id])
  #   @posts = Post.where(user_id: params[:id])
  # end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
