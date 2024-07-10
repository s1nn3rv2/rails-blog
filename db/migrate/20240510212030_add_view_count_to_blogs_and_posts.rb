class AddViewCountToBlogsAndPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :views, :integer, default: 0, null: false
    add_column :posts, :views, :integer, default: 0, null: false
  end
end
