class AddSlugToPeopleandparties < ActiveRecord::Migration
  def change
    add_column :peopleandparties, :slug, :string
    add_index :peopleandparties, :slug, unique: true
  end
end
