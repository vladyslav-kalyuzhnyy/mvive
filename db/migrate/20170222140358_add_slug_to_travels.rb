class AddSlugToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :slug, :string
    add_index :travels, :slug, unique: true
  end
end
