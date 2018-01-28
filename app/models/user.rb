class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_or_create_from_auth_hash(auth)
 		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
 			user.provider = auth.provider
 			user.uid = auth.uid
 			user.first_name = auth.info.first_name
 			user.last_name = auth.info.last_name
 			user.email = auth.info.email
 			user.picture = auth.info.image
			user.password = Devise.friendly_token[0, 20]
 			user.save!
 		end
 	end
end
