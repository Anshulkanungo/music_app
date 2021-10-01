class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: %i[ google_oauth2]
         enum role: {organizer:"organizer",listner: "listner"}

         has_many :playlists
         has_many :music
         has_many :favorites
         ratyrate_rater

         
 # devise :omniauthable, omniauth_providers: %i[facebook]
 # devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.create_from_google_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      #user.skip_confirmation!
    end
  end
end

def self.from_omniauth(auth)
  name_split = auth.info.name.split(" ")
  user = User.where(email: auth.info.email).first
  user ||= User.create!(provider: auth.provider, uid: auth.uid, last_name: name_split[0], first_name: name_split[1], email: auth.info.email, password: Devise.friendly_token[0, 20])
    user
end

#Anshul57745033