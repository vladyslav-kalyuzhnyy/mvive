class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.references :user
      t.string :name
      t.text :short
      t.string :news_day
      t.string :news_month
      t.text :body
      t.text :body2
      t.text :body3
      t.text :body4
      t.string :image
      t.string :image2
      t.string :image3
      t.string :image4
      t.timestamps
    end
  end
end
