class AddSlugToShoppingandmakeups < ActiveRecord::Migration
  def change
    add_column :shoppingandmakeups, :slug, :string
    add_index :shoppingandmakeups, :slug, unique: true
  end
end
