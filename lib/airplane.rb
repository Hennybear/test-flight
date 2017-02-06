class Airplane
	attr_reader :type, :wing_loading, :horse_power

	def initialize(type, wing_loading, horse_power, fuel = 100)
		@type, @wing_loading, @horsepower = type, wing_loading, horse_power
		@airplane_state = "off"
		@fuel = fuel
	end

	def start
		if @fuel < 10
			"Not enough fuel to start engine"
		else
			if @airplane_state == "on"
				"airplane already started"
			else
				@airplane_state = "on"
				@fuel -= 5
				"airplane started"
			end
		end
	end

	def takeoff
		if @fuel < 40
			"Not enough fuel to takeoff"
		else
			if @airplane_state == "on"
				@airplane_state = "flying"
				@fuel -= 30
	      "airplane launched"
	    else
	    	"airplane not started, please start"
	    end
  	end
	end

	def land
		if @fuel < 15 
			"Not enough fuel to land"
		else
			if @airplane_state == "off"
				"airplane not started, please start"
			elsif @airplane_state == "on"
				"airplane already on the ground"
			elsif @airplane_state == "flying"
				@fuel -= 5
				"airplane landed"
			end
		end
	end

end
