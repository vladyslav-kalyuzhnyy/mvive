class AddWorkingColumnsToShoppingandmakeups < ActiveRecord::Migration
  def change
    add_column :shoppingandmakeups, :working, :string
  end
end
