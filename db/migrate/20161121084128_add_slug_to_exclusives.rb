class AddSlugToExclusives < ActiveRecord::Migration
  def change
    add_column :exclusives, :slug, :string
    add_index :exclusives, :slug, unique: true
  end
end
