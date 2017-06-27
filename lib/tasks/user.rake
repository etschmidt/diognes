namespace :user do

	task :create => :environment do

		20.times do |n|
		  name  = Faker::Ancient.hero
		  email = "example-#{n+142}@diogn.es"
		  password = "Password1"
		  description = Faker::Hipster.paragraph
		  User.create!(name:  name,
		               email: email,
		               password:              password,
		               password_confirmation: password,
		               description: description, 
		               private: true)
		end
	end
end