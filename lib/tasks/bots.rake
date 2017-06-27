namespace :wod do
	task :test => :environment do
		wod = Wod.new
		
		print wod.print_ss
		print wod.print_wod
	end
	
	task :post => :environment do
		wod = Wod.new
		
		post = Post.new(user_id: 141, # 5 in dev 
							 			content: wod.print_ss + wod.print_wod)	
		post.save
	end
end


namespace :power do

	task :test => :environment do
		power = Power.new
		power.muscles
		power.reps

		print power.days + power.title + power.print_power
	end

	task :post => :environment do
		power = Power.new
		power.muscles
		power.reps

		post = Post.new(user_id: 163, # 5 in dev 
							 content: power.days + " - " + power.title + power.print_power)	
		post.save

	end

end