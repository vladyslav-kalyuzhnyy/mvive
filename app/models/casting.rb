class Casting < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  serialize :license
  validates :subject,  presence: true
  validates :price,  presence: true
  validates :country_code,  presence: true
  validates :city,  presence: true
  validates :task,  presence: true
  self.per_page = 7

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end
