class CreateCoAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :co_authors do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :permissions

      t.timestamps
    end
  end
end
