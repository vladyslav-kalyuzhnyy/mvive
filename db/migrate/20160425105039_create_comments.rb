class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :casting
      t.string :body
      t.timestamps
    end
  end
end
