class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :creator_id
      t.integer :rating
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
