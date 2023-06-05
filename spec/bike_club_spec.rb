require "./spec/spec_helper"

RSpec.describe BikeClub do
  before(:each) do
    @bike_club = BikeClub.new("Big Wheels")
    # bikers
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @biker3 = Biker.new("Philipe", 45)
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@bike_club).to be_an_instance_of(BikeClub)
      expect(@bike_club.name).to eq("Big Wheels")
      expect(@bike_club.bikers).to eq([])
    end
  end

end