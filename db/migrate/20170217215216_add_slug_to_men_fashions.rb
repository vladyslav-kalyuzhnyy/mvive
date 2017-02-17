class AddSlugToMenFashions < ActiveRecord::Migration
  def change
    add_column :men_fashions, :slug, :string
    add_index :men_fashions, :slug, unique: true
  end
end
