class Shoppingandmakeup < ActiveRecord::Base
  belongs_to :user

  friendly_id :name, use: :slugged
end