class CreateMviveTvs < ActiveRecord::Migration
  def change
    create_table :mvive_tvs do |t|
      t.references :user
      t.string :name
      t.text :short
      t.string :news_day
      t.string :news_month
      t.text :body
      t.text :body2
      t.string :image
      t.string :video
      t.timestamps
    end
  end
end
