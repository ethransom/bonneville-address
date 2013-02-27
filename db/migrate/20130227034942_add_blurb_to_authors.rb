class AddBlurbToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :blurb, :text
  end
end
