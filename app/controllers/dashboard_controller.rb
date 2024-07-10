class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to profile_dashboard_index_path
  end

  def my_blogs
    @user_blogs = current_user.blogs.order(created_at: :desc)
  end

  def password

  end

  def profile

  end
end