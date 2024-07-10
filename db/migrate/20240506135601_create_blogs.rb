class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :name, null: false
      t.string :description, null: true
      t.boolean :public, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
