class User < ActiveRecord::Base
  VALID_LOGIN_REGEX = /\A[A-z0-9\-_]+\z/
  validates :login,  presence: true, uniqueness: true , length: { maximum: 25, minimum: 6 }, format: {with: VALID_LOGIN_REGEX}
  validates :name,  presence: true, on: :update
  validates :surname,  presence: true, on: :update
  validates :city,  presence: true, on: :update
  validates :avatar, file_size: { less_than: 2.megabytes }
  validates :cover, file_size: { less_than: 2.megabytes }
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :timeoutable,
         :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]      
  has_one :model_profile, dependent: :destroy
  has_one :designer_profile, dependent: :destroy
  has_one :photographer_profile, dependent: :destroy
  has_one :stylist_profile, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name:  "Relationship", dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :castings, :dependent => :destroy
  has_many :comments
  has_many :feedbacks
  has_many :rating
  has_many :news
  has_many :fashionandmakeup
  has_many :fashionshow
  has_many :shoppingandmakeup
  has_many :exclusive
  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, CoverUploader
  acts_as_messageable
  
  def uname()
    "#{name} #{surname}"
  end
  
  def mailboxer_email(object)
    email
  end
  
  def age
     now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end
  
  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
   def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy!
  end
  
  def voted?(some_photo)
    votes.find_by(photo_id: some_photo.id)
  end
  
  def like!(some_photo)
    votes.create!(photo_id: some_photo.id)
  end
  
  def unlike!(some_photo)
    votes.find_by(photo_id: some_photo.id).destroy!
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
    end
  end

  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def profile
    case type
    when "Photographer"
      photographer_profile
    when "Model"
      model_profile
    when "Designer"
      designer_profile
      when "Stylist"
        stylist_profile
    end
  end
  
  def ruType
    case type
    when "Photographer"
      "Фотограф"
    when "Model"
      "Модель"
    when "Designer"
      "Модельер"
      when "Stylist"
        "Стилист"
    end
  end
  
   def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
   end

    def is_admin?
      admin == true
    end

   private
    def self.inheritance_column
      nil
    end
    
end
