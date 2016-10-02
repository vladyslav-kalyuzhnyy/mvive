class StylistProfile < ActiveRecord::Base
  belongs_to :user
  serialize :specialization
end