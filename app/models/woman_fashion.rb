class WomanFashion < ActiveRecord::Base
  extend FriendlyId

  belongs_to :user

  friendly_id :name, use: :slugged
end