class LoginModalController < ApplicationController
  skip_before_action :verify_authenticity_token

  def check_user_exists
    exists = User.exists?(email: login_modal_params[:email])
    respond_to do |format|
      format.json { render json: { exists: exists } }
    end
  end

  private

  def login_modal_params
    params.require(:user).permit(:email)
  end
end