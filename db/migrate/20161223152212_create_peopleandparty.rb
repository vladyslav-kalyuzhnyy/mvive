class CreatePeopleandparty < ActiveRecord::Migration
  def change
    create_table :peopleandparties do |t|
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
      t.string :image5
      t.string :image6
      t.string :image7
      t.string :image8
      t.string :image9
      t.string :image10
      t.timestamps
    end
  end
end
