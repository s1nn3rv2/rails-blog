class PasswordsController < ApplicationController
  before_action :authenticate_user!

  def update
    @user = User.find_by_id(params[:id])
    @user.update password_params

    if @user.save!
      redirect_to password_dashboard_index_path
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end