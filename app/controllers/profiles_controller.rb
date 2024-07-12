class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def search
    blog = Blog.find(params[:blog_id])

    existing_co_author_ids = blog.co_authors.pluck(:user_id)

    results = params[:co_author_key].empty? ? [] : Profile.where("CONCAT('@', lower(username)) LIKE ? AND user_id not in (?)", "%#{params[:co_author_key]}%", existing_co_author_ids).limit(10)

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