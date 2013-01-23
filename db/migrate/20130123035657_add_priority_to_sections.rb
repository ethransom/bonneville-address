class AddPriorityToSections < ActiveRecord::Migration
  def change
    add_column :sections, :priority, :integer, :default => 1
  end
end
