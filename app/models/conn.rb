class Conn < ApplicationRecord

	def initialize
		@station = STATION.sample
		@direction = DIRECTION.sample
		@angle = ANGLE.sample
		@heading = HEADING.sample
		@way = WAY.sample
		@bell = BELL.sample
	end

	STATION = ["helm", "helm", "helm", "leehelm"]
	DIRECTION = ["right", "left"]
	ANGLE = ["five degrees", "ten degrees", "standard", "full", "five degrees", "ten degrees", "standard", "full", "HARD"]
	HEADING = ["000", "030", "060", "090", "120", "150", "180", "210", "240", "270", "300", "330"]
	WAY = ["ahead", "ahead", "ahead", "ahead", "back", "stop"]
	BELL = ["one third", "two thirds", "standard", "full", "one third", "two thirds", "standard", "full", "flank"]

	def print_order
		if @station == "helm"
			if @angle == "HARD"
				"HARD #{@direction} rudder, steady course #{@heading}"
			else
				"#{@direction} #{@angle} rudder, steady course #{@heading}"
			end
		else #leeehelm
			"All #{@way} #{@bell}"
		end 
	end


end
