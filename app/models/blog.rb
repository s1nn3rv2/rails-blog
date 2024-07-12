require 'open-uri'

class Blog < ApplicationRecord
  paginates_per 24

  after_create :attach_default_background

  enum :visibility, { visible: 0, hidden: 1 }

  validates_presence_of :name, :visibility, :user_id

  has_one_attached :background

  belongs_to :user

  has_many :posts, dependent: :destroy
  has_many :co_authors, dependent: :destroy

  def latest_updated_post
    posts.order(updated_at: :desc).first
  end

  def last_updated_at
    if latest_updated_post.present?
      if latest_updated_post&.updated_at > self.updated_at
        latest_updated_post&.updated_at
      else
        self.updated_at
      end
    end
  end

  def total_views
    post_views + self.views
  end

  def post_views
    self.posts.sum(:views)
  end

  private

  def attach_default_background
    unless background.attached?
      background.attach(io: URI.open('https://images.unsplash.com/photo-1714837291207-4985c06c9a60?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D').open, filename: 'default-background.jpg', content_type: 'image/jpg')
    end
  end
end
