class DesignerProfile < ActiveRecord::Base
  belongs_to :user
  serialize :specialization
  serialize :license
  serialize :events
end
