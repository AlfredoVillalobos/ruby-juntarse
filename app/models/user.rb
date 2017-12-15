class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  has_many :user_sports, dependent: :destroy
  has_many :disponibilities, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :sports, through: :user_sports
  has_many :invitations_to, :class_name => 'Invitation', :foreign_key => :to_id
  has_many :invitations_from, :class_name => 'Invitation', :foreign_key => :from_id

  geocoded_by :address
  after_validation :geocode

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end
end
