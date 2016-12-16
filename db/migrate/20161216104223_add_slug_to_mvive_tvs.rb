class AddSlugToMviveTvs < ActiveRecord::Migration
  def change
    add_column :mvive_tvs, :slug, :string
    add_index :mvive_tvs, :slug, unique: true
  end
end
