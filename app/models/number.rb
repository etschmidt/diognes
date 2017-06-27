class Number < ApplicationRecord

	def print_number
		[*('a'..'z'),*('0'..'9')].shuffle[0,36].join
	end

end
