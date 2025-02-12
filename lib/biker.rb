class Biker
  attr_reader :name,
              :max_distance,
              :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, distance)
    return unless @acceptable_terrain.include?(ride.terrain)

    if @rides.key?(ride)
      @rides[ride] << distance
    else
      @rides[ride] = [distance]
    end
  end

  def personal_record(ride)
    return false if ride.total_distance > @max_distance
    return unless @acceptable_terrain.include?(ride.terrain) 
    @rides[ride].min 
  end
end