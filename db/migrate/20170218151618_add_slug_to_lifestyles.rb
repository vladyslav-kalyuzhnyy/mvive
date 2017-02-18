class AddSlugToLifestyles < ActiveRecord::Migration
  def change
    add_column :lifestyles, :slug, :string
    add_index :lifestyles, :slug, unique: true
  end
end
