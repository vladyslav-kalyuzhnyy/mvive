class AddImage36ToPeopleandparties < ActiveRecord::Migration
  def change
    add_column :peopleandparties, :image36, :string
  end
end
