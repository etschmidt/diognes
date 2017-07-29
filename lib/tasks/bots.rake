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

	task :multi => :environment do 

		20.times do |n|
			wod = Wod.new
			Post.create!( user_id: 141,
										content: wod.print_wod)
		end
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
		number = Number.new
			Post.create!( user_id: 184,
										content: number.print_number.to_s + "<br>" + number.print_number.to_s + "<br>" + number.print_number.to_s + "<br>" +
										number.print_number.to_s + "<br>" + number.print_number.to_s + "<br>" + number.print_number.to_s + "<br>")
		end
	end
end

namespace :conn do
	
	task :test => :environment do
		conn = Conn.new
		
		print conn.print_order + "\n"
	end
	
	task :post => :environment do
		conn = Conn.new
		
		post = Post.new(user_id: 225, # 5 in dev 
							 			content: conn.print_order)	
		post.save
	end

	task :multi => :environment do 

		50.times do |n|
		conn = Conn.new
			Post.create!( user_id: 225,
										content: conn.print_order)
		end
	end
end

namespace :purge do

	task :tendays => :environment do

		Post.where('user_id IN (?)', [141, 163, 156, 25, 184, 225]).where('created_at < ?', 10.days.ago).each do |p|
			p.destroy
		end

	end

end
