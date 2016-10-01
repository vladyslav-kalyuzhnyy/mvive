class CreateStylistProfiles < ActiveRecord::Migration
  def change
    create_table :stylist_profiles do |t|
      t.references :user
      t.string :experience
      t.string :specialization
      t.string :work_place
      t.timestamps
    end
  end
end
