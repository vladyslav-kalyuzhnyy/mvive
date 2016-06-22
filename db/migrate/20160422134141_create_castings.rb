class CreateCastings < ActiveRecord::Migration
  def change
    create_table :castings do |t|

      t.integer :rating
      t.string :subject
      t.string :price
      t.string :tag1
      t.string :tag2
      t.string :tag3
      t.string :country_code
      t.string :city
      t.text :task
      t.string :license
      t.string :selected, default: ""
      t.references :user
      t.timestamps
      
    end
  end
end
