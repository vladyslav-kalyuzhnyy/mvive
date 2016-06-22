class PhotographerProfile < ActiveRecord::Base
  belongs_to :user
  serialize :specialization 
  serialize :license
end
