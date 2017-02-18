class CreateKrasotaTaZdorovja < ActiveRecord::Migration
  def change
    create_table :krasota_ta_zdorovjas do |t|
      t.references :user
      t.string :name
      t.text :short
      t.string :news_day
      t.string :news_month
      t.text :body
      t.text :body2
      t.text :body3
      t.text :body4
      t.text :body5
      t.text :body6
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
