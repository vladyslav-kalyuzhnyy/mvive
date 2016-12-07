class AddPhoneinsideColumnsToShoppingandmakeups < ActiveRecord::Migration
  def change
    add_column :shoppingandmakeups, :phoneinside, :string
  end
end
