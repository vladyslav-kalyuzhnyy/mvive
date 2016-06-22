class CreateModelProfiles < ActiveRecord::Migration
  def change
    create_table :model_profiles do |t|
      t.references :user
      t.string :work_place
      t.string :experience
      t.string :specializationt
      t.string :specialization
      t.string :events
      t.string :license
      t.string :haircolor
      t.string :hairsize
      t.string :face
      t.string :eyes
      t.integer :boobs
      t.integer :waist
      t.integer :hip
      t.integer :height
      t.integer :mass
      t.string :clothes
      t.timestamps
    end
  end
end
