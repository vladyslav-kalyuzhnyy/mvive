class AddSlugToBeautyTrends < ActiveRecord::Migration
  def change
    add_column :beauty_trends, :slug, :string
    add_index :beauty_trends, :slug, unique: true
  end
end
