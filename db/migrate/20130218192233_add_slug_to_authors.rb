class AddSlugToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :slug, :string
    add_index :authors, :slug, unique: true

    # probably a bad idea in practice, but all we are doing is saving
    Author.find_each(&:save)
  end
end
