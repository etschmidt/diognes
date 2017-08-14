class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy

	validates :name, presence: true, length: { maximum: 85 }
	validates :email, presence: true, length: { maximum: 100 }

	is_impressionable :counter_cache => true, :unique => :request_hash

def self.from_omniauth(auth)
	where(auth.slice(:provider, :uid)).first_or_create do |user|
		user.provider = auth.provider
		user.uid = auth.uid
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

def self.search(search)
  search.present? ? where('name LIKE ?', "%#{search}%") : all
end

end
