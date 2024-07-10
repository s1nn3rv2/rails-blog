class ChangeBlogPublicToVisibilityEnum < ActiveRecord::Migration[7.1]
  def change
    remove_column :blogs, :public, :boolean
    add_column :blogs, :visibility, :integer, default: 1
  end
end
