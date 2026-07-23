class HomeController < ApplicationController
  def index
    @featured_blogs = Blog.visible
                          .joins(:posts)
                          .order(views: :desc)
                          .limit(6)
                          .distinct

    @stats = {
      blogs: Blog.visible.count,
      posts: Post.joins(:blog).merge(Blog.visible).count,
      members: User.count
    }
  end

  def about

  end
end
