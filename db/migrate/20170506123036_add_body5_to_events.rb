class AddBody5ToEvents < ActiveRecord::Migration
  def change
    add_column :events, :body5, :string
    add_column :events, :body6, :string
    add_column :events, :body7, :string
    add_column :events, :body8, :string
    add_column :events, :body9, :string
    add_column :events, :body10, :string
    add_column :events, :body11, :string
    add_column :events, :body12, :string
    add_column :events, :body13, :string
  end
end
