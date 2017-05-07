class CreateBlogOlenaNazar < ActiveRecord::Migration
  def change
    create_table :blog_olena_nazars do |t|
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
      t.text :body7
      t.text :body8
      t.string :image
      t.string :image2
      t.string :image3
      t.string :image4
      t.string :image5
      t.string :image6
      t.string :image7
      t.string :image8
      t.timestamps
    end
  end
end
