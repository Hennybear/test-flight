require_relative "../../lib/airplane"

describe Airplane do
	let(:my_plane) { Airplane.new("cesna", 10, 150) }

  describe "#initialization" do
  	it 'has a type of Cesna' do 
  		expect(my_plane.type).to eq("cesna")
  	end
  end

  describe "#start" do
  	it 'starts the plane if the plane is off' do 
  		expect(my_plane.start).to eq("airplane started")
  	end

  	it 'tells us that the plane was already started' do 
  		my_plane.start
  		expect(my_plane.start).to eq("airplane already started") 
  	end
  end

  describe "#takeoff" do
  	it 'returns that the "airplane launched"' do 
   		my_plane.start
  		expect(my_plane.takeoff).to eq("airplane launched") 	
  	end

  	it 'can only takeoff if the plane was already started' do 
  		expect(my_plane.takeoff).to eq("airplane not started, please start")   		
  	end

  	it 'can only takeoff if the plane was already started' do 
  		my_plane.start
  		expect(my_plane.takeoff).to eq("airplane launched")
  	end
  end

  describe "#land" do
  	it 'cannot land if the airplane is not started' do 
  		expect(my_plane.land).to eq("airplane not started, please start")
  	end

		it 'cannot land if the aiplane is already on the ground' do 
  		my_plane.start
  		expect(my_plane.land).to eq("airplane already on the ground")
  	end

 		it 'can only land if the airplane is already in the air' do 
  		my_plane.start
  		my_plane.takeoff
  		expect(my_plane.land).to eq("airplane landed")
  	end
  end

  describe "#fuel" do 
  	it 'cannot start if the fuel level is below 10 gallons' do 
  		my_plane = Airplane.new("cesna", 10, 150, 5)
  		expect(my_plane.start).to eq("Not enough fuel to start engine")
  	end

  	it 'cannot takeoff if the fuel level is below 50 gallons' do 
  		my_plane = Airplane.new("cesna", 10, 150, 39)
  		my_plane.start
  		expect(my_plane.takeoff).to eq("Not enough fuel to takeoff")
  	end

  	it 'cannot land if the fuel level is below 10 gallons' do 
  		my_plane = Airplane.new("cesna", 10, 150, 45)
  		my_plane.start
  		my_plane.takeoff
  		expect(my_plane.land).to eq("Not enough fuel to land")
  	end
  end

end













