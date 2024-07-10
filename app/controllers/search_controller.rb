class SearchController < ApplicationController
  def index
    page = params[:page].present? ? params[:page] : 1
    key = "%#{params[:key]}%"
    @blogs = Blog.where("lower(name) LIKE ?", key.downcase).page(page)
    @pages_count = @blogs.total_pages
  end

  def search
    redirect_to search_results_path(key: params[:key], page: params[:page])
  end
end