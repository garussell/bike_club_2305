require './spec/spec_helper'

RSpec.describe Biker do
  before(:each) do
    # bikers
    @biker = Biker.new("Kenny", 30)
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
    it "can log rides" do
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      expect(@biker.rides).to eq({
        @ride1 => [92.5, 91.1],
        @ride2 => [60.9, 61.6]
      })
    end
  end

  describe "#personal_record(ride)" do
    it "can record the rider's personal record for the ride" do
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      expect(@rider.personal_record(@ride1)).to eq(91.1)
      expect(@rider.personal_record(@ride2)).to eq(60.9)
    end
  end
end