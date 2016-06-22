class CreateDesignerProfiles < ActiveRecord::Migration
  def change
    create_table :designer_profiles do |t|
      t.references :user
      t.string :experience
      t.string :specialization
      t.string :work_place
      t.string :events
      t.timestamps
    end
  end
end
