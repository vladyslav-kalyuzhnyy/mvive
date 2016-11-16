class CreateShoppingandmakeup < ActiveRecord::Migration
  def change
    create_table :shoppingandmakeups do |t|
      t.references :user
      t.string :name
      t.text :short
      t.string :address
      t.string :phone
      t.text :body
      t.text :body2
      t.text :body3
      t.text :body4
      t.string :image
      t.string :image2
      t.string :image3
      t.string :image4
      t.string :image5
      t.string :image6
      t.timestamps
    end
  end
end
