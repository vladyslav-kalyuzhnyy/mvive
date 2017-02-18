class AddSlugToKrasotaTaZdorovjas < ActiveRecord::Migration
  def change
    add_column :krasota_ta_zdorovjas, :slug, :string
    add_index :krasota_ta_zdorovjas, :slug, unique: true
  end
end
