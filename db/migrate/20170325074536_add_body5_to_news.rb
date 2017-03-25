class AddBody5ToNews < ActiveRecord::Migration
  def change
    add_column :news, :body5, :string
    add_column :news, :body6, :string
    add_column :news, :body7, :string
    add_column :news, :body8, :string
    add_column :news, :body9, :string
    add_column :news, :body10, :string
  end
end
