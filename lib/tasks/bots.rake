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
							 content: "<strong>" + power.days + " - " + power.title + "</strong>" + power.print_power)	
		post.save

	end

end

namespace :ppl do

	task :test => :environment do
		ppl = Ppl.new
		ppl.isolates
		ppl.compounds
		ppl.muscles
		
		print ppl.print_ppl
	end
	
	task :post => :environment do
		ppl = Ppl.new
		ppl.isolates
		ppl.compounds
		ppl.muscles
		
		post = Post.new(	 
							 user_id: 156, #PhillyTraining
							 content: "<strong>" + ppl.title + "</strong><br><br>" + ppl.print_ppl)	
		post.save
	end
	
end

namespace :quote do

	task :post => :environment do

		quote = Quote.new

		post = Post.new( user_id: 25,
										content: quote.print_quote)
		post.save
	end
end

namespace :number do

	task :post => :environment do

		number = Number.new

		post = Post.new( user_id: 184,
										content: number.print_number.to_s + "<br>" + number.print_number.to_s + "<br>" + number.print_number.to_s + "<br>" +
										number.print_number.to_s + "<br>" + number.print_number.to_s + "<br>" + number.print_number.to_s + "<br>")
		post.save
	end

	task :multi => :environment do

		50.times do |n|
			Post.create!( user_id: 184,
										content: number.print_number.to_s + "<br>" + number.print_number.to_s + "<br>" + number.print_number.to_s + "<br>" +
										number.print_number.to_s + "<br>" + number.print_number.to_s + "<br>" + number.print_number.to_s + "<br>")
		end
	end
end