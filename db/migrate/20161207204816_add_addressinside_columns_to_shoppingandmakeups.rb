class AddAddressinsideColumnsToShoppingandmakeups < ActiveRecord::Migration
  def change
    add_column :shoppingandmakeups, :addressinside, :string
  end
end
