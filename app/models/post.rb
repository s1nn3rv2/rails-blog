class Post < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  has_rich_text :body

  def sanitized_body
    body.to_plain_text
  end
end
