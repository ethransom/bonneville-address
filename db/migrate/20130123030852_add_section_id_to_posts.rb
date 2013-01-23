class AddSectionIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :section_id, :string
  end
end
