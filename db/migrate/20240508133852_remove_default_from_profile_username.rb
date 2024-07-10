class RemoveDefaultFromProfileUsername < ActiveRecord::Migration[7.1]
  def change
    change_column :profiles, :username, :string, default: '', null: false
  end
end
