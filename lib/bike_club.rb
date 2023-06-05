class BikeClub
  attr_reader :name,
              :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def logged_most_rides
    @bikers.max_by { |biker| biker.rides.values.flatten.count }
  end
  
  def fastest_time(ride)
    @bikers.min_by { |biker| biker.rides[ride].min }
  end
end