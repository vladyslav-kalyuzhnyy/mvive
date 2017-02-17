class AddSlugToFashionshows < ActiveRecord::Migration
  def change
    add_column :fashionshows, :slug, :string
    add_index :fashionshows, :slug, unique: true
  end
end
