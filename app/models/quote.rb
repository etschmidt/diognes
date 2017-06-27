class Quote < ApplicationRecord

	def initialize 
		
		@quote = QUOTES.sample
	
	end

	def print_quote

			"#{@quote}"

	end

end