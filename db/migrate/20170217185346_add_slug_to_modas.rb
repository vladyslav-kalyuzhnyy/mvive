class AddSlugToModas < ActiveRecord::Migration
  def change
    add_column :modas, :slug, :string
    add_index :modas, :slug, unique: true
  end
end
