class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :google_oauth2 ]

  # Finds an existing admin for this Google account, or creates one on first login.
  def self.from_google(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |admin|
      admin.email = auth.info.email
      admin.full_name = auth.info.name
      admin.avatar_url = auth.info.image
      admin.password = Devise.friendly_token[0, 20]
    end
  end
end
