class Post < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  full_sanitizer = Rails::HTML5::FullSanitizer.new

  def sanitized_body
    full_sanitizer.sanitize(self.body)
  end

  private

  def full_sanitizer
    @full_sanitizer ||= Rails::HTML5::FullSanitizer.new
  end
end
