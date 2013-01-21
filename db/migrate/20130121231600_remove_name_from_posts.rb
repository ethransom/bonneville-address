class RemoveNameFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :name
  end

  # def self.up
  #   execute "ALTER TABLE posts DROP COLUMN author_id"
  # end

  def down
    add_column :posts, :name, :string
  end
end
