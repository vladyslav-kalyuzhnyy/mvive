class AddSlugToBeautyNovunkus < ActiveRecord::Migration
  def change
    add_column :beauty_novunkus, :slug, :string
    add_index :beauty_novunkus, :slug, unique: true
  end
end
