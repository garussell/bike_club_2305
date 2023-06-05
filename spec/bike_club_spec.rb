require "./spec/spec_helper"

RSpec.describe BikeClub do
  before(:each) do
    @bike_club = BikeClub.new("Big Wheels")
    # bikers
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @biker3 = Biker.new("Philipe", 45)
    # rides
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@bike_club).to be_an_instance_of(BikeClub)
      expect(@bike_club.name).to eq("Big Wheels")
      expect(@bike_club.bikers).to eq([])
    end
  end

  describe "#add_biker" do
    it "can add bikers to the club" do
      @bike_club.add_biker(@biker)
      @bike_club.add_biker(@biker2)
      @bike_club.add_biker(@biker3)

      expect(@bike_club.bikers).to eq([@biker, @biker2, @biker3])
    end
  end
  describe "#logged_most_rides" do
    it "can tell us which Biker has logged the most rides" do
      # bikers know the terrain
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker3.learn_terrain!(:gravel)
      @biker3.learn_terrain!(:hills)
      #bikers log some rides
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker2.log_ride(@ride1, 97.0)
      @biker2.log_ride(@ride2, 67.0)
      @biker3.log_ride(@ride1, 104.3)
      @biker3.log_ride(@ride1, 91.0)
      @biker3.log_ride(@ride2, 65.5)

      expect(@bike_club.logged_most_rides).to eq(@biker3)
    end
  end
end