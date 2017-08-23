class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauth_providers => [:twitter, :facebook]

  has_many :posts, dependent: :destroy

	validates :name, presence: true, length: { maximum: 85 }
	validates :email, presence: true, length: { maximum: 100 }

	is_impressionable :counter_cache => true, :unique => :request_hash

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    if auth.info.nickname
	    user.name = auth.info.nickname  #twitter
    else
    	user.name = auth.info.name
    	user.description = auth.info.about
    end
    user.email = "#{user.uid}@diogn.es" #there'a got to be a better way than this, but CAN'T FIND OUT OHOW TO GET THE EMAIL FROM TWITTER
    user.save!
  end
end

def self.new_with_session(params, session)
	if session["devise.user_attributes"]
		new(session["devise.user_attributes"], without_protection = true) do |user|
			user_attributes = params
			user.valid?
		end
	else
		super
	end
end

def password_required?
	super && provider.blank?
end

def update_with_password(params, *options)
	if encrypted_password.blank?
		update_attributes(params, *options)
	else 
		super
	end
end

def self.search(search)
  search.present? ? where('name LIKE ?', "%#{search}%") : all
end

end
