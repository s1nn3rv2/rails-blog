class AddBlogReferenceToCoAuthor < ActiveRecord::Migration[7.1]
  def change
    add_reference :co_authors, :blog, index: true
  end
end
