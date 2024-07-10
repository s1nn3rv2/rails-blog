class AddUsernameToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :username, :string, null: false, default: (0...16).map { (65 + rand(26)).chr }.join, :limit => 32
  end
end
