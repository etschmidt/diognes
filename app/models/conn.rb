class Conn < ApplicationRecord

	def initialize
		@station = STATION.sample
		@direction = DIRECTION.sample
		@angle = ANGLE.sample
		@heading = HEADING.sample
		@way = WAY.sample
		@bell = BELL.sample
		@other = OTHER.sample
		@extra = rand()*10
		@hand = rand()*10
	end

	STATION = ["helm", "helm", "helm", "leehelm"]
	DIRECTION = ["Right", "Left"]
	ANGLE = ["five degrees", "ten degrees", "standard", "full", "five degrees", "ten degrees", "standard", "full", "HARD",
  				 "five degrees", "ten degrees", "standard", "full", "five degrees", "ten degrees", "standard", "full", "HARD",
  				 "handsomely", "smartly"]
	HEADING = ["000", "030", "060", "090", "120", "150", "180", "210", "240", "270", "300", "330"]
	WAY = ["ahead", "ahead", "ahead", "ahead", "back", "stop"]
	BELL = ["one third", "two thirds", "standard", "full", "one third", "two thirds", "standard", "full", "flank"]
	OTHER = ["Rudder amidships", "Check your rudder", "Steady as she goes", "Keep her so", "Mind your rudder!", "Shift your rudder", "Meet her"]

	def print_order
		if @station == "helm"
			if @extra > 8
				"#{@other}"
			else
				if @hand > 2
					if @angle == "HARD"
						@direction.downcase
						"HARD #{@direction} rudder, steady on course #{@heading}"
					elsif @angle == "handsomely" or @angle == "smartly"
						"#{@direction} #{@angle}, steady on course #{@heading}"
					else
						"#{@direction} #{@angle} rudder, steady on course #{@heading}"
					end
				else
					if @angle == "HARD"
						@direction.downcase
						"HARD #{@direction} rudder"
					elsif @angle == "handsomely" or @angle == "smartly"
						"#{@direction} #{@angle}"
					else
						"#{@direction} #{@angle} rudder"
					end
				end
			end
		else #leeehelm
			if @way == "stop"
				"All stop"
			else
				"All #{@way} #{@bell}"
			end
		end 
	end

end
