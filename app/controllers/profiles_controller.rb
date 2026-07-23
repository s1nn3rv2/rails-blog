class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def search
    blog = Blog.find(params[:blog_id])

    excluded_user_ids = blog.co_authors.pluck(:user_id) + [blog.user_id]

    results = if params[:co_author_key].blank?
                []
              else
                key = "%#{params[:co_author_key].downcase}%"
                Profile.where(
                  "user_id NOT IN (?) AND (
                    lower(username) LIKE ? OR
                    lower(first_name) LIKE ? OR
                    lower(last_name) LIKE ? OR
                    lower(CONCAT(first_name, ' ', last_name)) LIKE ?
                  )",
                  excluded_user_ids, key, key, key, key
                ).limit(10)
              end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
                 turbo_stream.update("blog_co_author_results", partial: "blogs/found_profiles", locals: { co_authors: results, blog_id: params[:blog_id] })
      end
    end
  end

  def show
    # @profile = Profile.friendly.find_by_id(params[:id])
    # @profile = Profile.friendly.find_by(username: params[:id])
    @profile = Profile.find_by_id(params[:id])
  end

  def update
    @profile = User.find_by_id(params[:id]).profile

    @profile.update profile_params

    if @profile.save!
      redirect_to profile_dashboard_index_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar)
  end
end