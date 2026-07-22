class MigratePostBodyToActionText < ActiveRecord::Migration[8.1]
  def up
    execute <<-SQL
      INSERT INTO action_text_rich_texts (name, body, record_type, record_id, created_at, updated_at)
      SELECT 'body', body, 'Post', id, created_at, updated_at FROM posts
    SQL
  end

  def down
    execute "DELETE FROM action_text_rich_texts WHERE record_type = 'Post' AND name = 'body'"
  end
end
