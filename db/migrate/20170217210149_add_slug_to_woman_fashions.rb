class AddSlugToWomanFashions < ActiveRecord::Migration
  def change
    add_column :woman_fashions, :slug, :string
    add_index :woman_fashions, :slug, unique: true
  end
end
