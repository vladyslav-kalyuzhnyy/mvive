class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.string :name
      t.text :short
      t.string :events_day
      t.string :events_month
      t.string :events_adress
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
