class CreatePhotographerProfiles < ActiveRecord::Migration
  def change
    create_table :photographer_profiles do |t|
      t.references :user
      t.string :experience
      t.string :specialization
      t.string :license
      t.string :work_place
      t.string :camera
      t.timestamps
    end
  end
end
