class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:id])
  end

  def new
    @post = Post.new
    @blog = Blog.find_by_id(params[:blog_id])
  end

  def create
    @blog = Blog.find_by_id(params[:blog_id])
    @post = @blog.posts.new(post_params)
    @post.user = current_user

    if @post.save!
      redirect_to blog_path(@post.blog)
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end