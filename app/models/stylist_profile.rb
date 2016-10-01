class StylistProfile < ActiveRecord::Base
  belongs_to :user
  serialize :specialization
  serialize :work_place
end