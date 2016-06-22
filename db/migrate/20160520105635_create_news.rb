class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.references :user
      t.string :name
      t.text :short
      t.string :news_day
      t.string :news_month
      t.text :body
      t.string :image
      t.timestamps
    end
  end
end
