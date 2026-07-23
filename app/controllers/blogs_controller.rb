class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    page = params[:page].present? ? params[:page] : 1
    @blogs = Blog.visible.page(page)
    @pages_count = @blogs.total_pages
  end

  def show
    @blog = Blog.find(params[:id])

    @author = @blog.user
    @is_author = @blog.user_id == current_user&.id

    @posts = @blog.posts.order(created_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)

    if @blog.save!
      redirect_to @blog
    else
      render :new
    end
  end

  def edit
    @blog = current_user.blogs.find(params[:id])
  end

  def update
    @blog = current_user.blogs.find(params[:id])
    @blog.update blog_params
    if @blog.save!
      redirect_to @blog
    end
  end

  def destroy
    @blog = current_user.blogs.find(params[:id])
    @blog.destroy!

    if @blog.save
      redirect_to :show
    else
      render :new
    end
  end

  def add_new_coauthor
    blog = current_user.blogs.find(params[:blog_id])
    co_author = blog.co_authors.build(user: User.find_by_id(params[:id]))
    if co_author.save!
      redirect_to blog_path(blog)
    end
  end

  def remove_coauthor
    blog = current_user.blogs.find(params[:blog_id])
    co_author = blog.co_authors.find(params[:id])
    co_author.destroy!
    if blog.save!
      redirect_to blog_path(blog)
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:name, :description, :visibility, :user, :background)
  end
end