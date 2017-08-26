class Power < ApplicationRecord

	def initialize
		@month = Date.today.strftime("%B")
		@day = Date.today.strftime("%A")
		@date = Date.today.strftime("%d")
		@days = days
	end

	def title
		if @day == "Monday"
			return "Recovery <br><br>"
		elsif @day == "Tuesday"
   		return "Squat Day <br><br>"
		elsif @day == "Wednesday"
			return "Press Day <br><br>"
		elsif @day == "Thursday"
			return "Recovery <br><br>"
		elsif @day == "Friday"
			return "Deadlift Day <br><br>"
		elsif @day == "Saturday"
			return "Bench Day <br><br>"
		else #Sunday
			return "Rest <br><br>"
		end 
	end
	
	def days
		if @day == "Monday"
			return "Monday"
		elsif @day == "Tuesday"
   		return "Tuesday"
		elsif @day == "Wednesday"
			return "Wednesday"
		elsif @day == "Thursday"
			return "Thursday"
		elsif @day == "Friday"
			return "Friday"
		elsif @day == "Saturday"
			return "Saturday"
		else #Sunday
			return "Sunday"
		end 
	end

	def muscles
		if @day == "Monday" or @day == "Thursday"
			return ""
		elsif @day == "Tuesday" or @day == "Friday"
			return "Legs, Back"
		elsif @day == "Wednesday" or @day == "Saturday"
			return "Chest, shoulders"
		elsif @day == "Sunday"
			return ""
		end 
	end

	def reps
		if @month == "June" or @month == "September" or @month == "December" or @month =="March"
			@reps1 = "5"
			@reps2 = "8"
		elsif @month == "July" or @month == "October"	or @month == "January" or @month =="April"
			@reps1 = "3"
			@reps2 = "6"
		elsif @month == "August" or @month == "November" or @month == "February" or @month =="May"
			if @date.to_i <= 15
				@reps1 = "2"
				@reps2 = "6"
			else
				@reps1 = "1"
				@reps2 = "6"
			end
		end
	end

	def print_power
		if @date.to_i >= 21 && (@month == "August" or @month == "November" or @month == "February" or @month =="May")
			return "Light cardio and active recovery. Focus on stretching/ rehab for knees, hips and shoulders.<br>" +
							"Don't forget to reduce caloric intake when not lifting"
		else
			if @day == "Monday"
				return "Light cardio and active recovery"

			elsif @day == "Tuesday"
	   		return "Squat - 3 sets of #{@reps1}<br>" +
	   						"Pause Squat 3 sets of #{@reps1}<br>" +
								"RDL - 2 sets of #{@reps2}<br>" + 
								"Abs - 2 sets of 8 per lift attempted"

			elsif @day == "Wednesday"
				return "Hang Cleans - 3 sets of #{@reps1}<br>" +
								"Floor Press - 2 sets of #{@reps2}<br>" +
								"Chins, weighted - 3 sets of #{@reps2}<br>" +
								"Standing Press - 3 sets of #{@reps2}<br>" +
								"Face pulls - 2 sets of 12"

			elsif @day == "Thursday"
				return "Light cardio and active recovery"

			elsif @day == "Friday"
				return "Deadlift - 3 sets of #{@reps1}<br>" +
								"Lat Pulls - 3 sets of #{@reps2}<br>" +
								"Good Mornings - 3 sets of #{@reps1}<br>" +
								"Overhead Squat - 2 sets of #{@reps2}<br>" +
								"Abs - 2 sets of 8 per lift attempted"

			elsif @day == "Saturday"
				return "Bench - 3 sets of #{@reps1}<br>" +
								"Chains/Boards - 3 sets of #{@reps1}<br>" +
								"Triceps - 2 sets of #{@reps2}<br>" +
								"Pecs (weighted dips) - 3 sets of #{@reps2}<br>" +
								"One arm rows - 3 sets of #{@reps2}<br>" +
								"Rear Delts - 2 sets of #{@reps2}"

			else #Sunday
				return "Take a day off - you've earned it!"
			end

		end
	end

end