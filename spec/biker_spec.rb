require "./spec/spec_helper"

RSpec.describe Biker do
  before(:each) do
    # bikers
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    # rides
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@biker).to be_an_instance_of(Biker)
      expect(@biker.name).to eq("Kenny")
      expect(@biker.max_distance).to eq(30)
      expect(@biker.rides).to eq({})
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe "#learn_terrain!" do
    it "can learn new terrain" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe "#log_ride" do
    it "can log rides IF the terrain has been learnd" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      expect(@biker.rides).to eq({
        @ride1 => [92.5, 91.1],
        @ride2 => [60.9, 61.6]
      })

       # biker2 has not learned terrain yet
       @biker2.log_ride(@ride1, 97.0)
       @biker2.log_ride(@ride2, 67.0)
       expect(@biker2.rides).to eq({})
    end
  end

  describe "#personal_record(ride)" do
    it "can record the rider's personal record for the ride" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)

      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      
      @biker2.log_ride(@ride1, 95.0)
      @biker2.log_ride(@ride2, 65.0)

      expect(@biker2.personal_record(@ride2)).to eq(65.0)
      # biker2 cannot ride this distance
      expect(@biker2.personal_record(@ride1)).to be false
    end
  end


end