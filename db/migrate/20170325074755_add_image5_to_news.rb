class AddImage5ToNews < ActiveRecord::Migration
  def change
    add_column :news, :image5, :string
    add_column :news, :image6, :string
    add_column :news, :image7, :string
    add_column :news, :image8, :string
    add_column :news, :image9, :string
    add_column :news, :image10, :string
  end
end
