class AddSlugToKulturas < ActiveRecord::Migration
  def change
    add_column :kulturas, :slug, :string
    add_index :kulturas, :slug, unique: true
  end
end
