class AddSlugToBlogOlenaNazars < ActiveRecord::Migration
  def change
    add_column :blog_olena_nazars, :slug, :string
    add_index :blog_olena_nazars, :slug, unique: true
  end
end
