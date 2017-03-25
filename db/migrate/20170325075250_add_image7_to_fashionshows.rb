class AddImage7ToFashionshows < ActiveRecord::Migration
  def change
    add_column :fashionshows, :image7, :string
    add_column :fashionshows, :image8, :string
    add_column :fashionshows, :image9, :string
    add_column :fashionshows, :image10, :string
    add_column :fashionshows, :image11, :string
    add_column :fashionshows, :image12, :string
    add_column :fashionshows, :image13, :string
    add_column :fashionshows, :image14, :string
    add_column :fashionshows, :image15, :string
  end
end
