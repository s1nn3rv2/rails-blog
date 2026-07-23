class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_blog
  before_action :require_write_access, except: [:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = @blog.posts.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to blog_path(@blog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to blog_post_path(@blog, @post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to blog_path(@blog)
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def set_post
    @post = @blog.posts.find(params[:id])
  end

  def require_write_access
    unless @blog.can_write?(current_user)
      redirect_to blog_path(@blog), alert: "You don't have permission to do that."
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end