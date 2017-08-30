class StationInfo

  attr_reader :station_name
  def initialize(station_atts={})
    binding.pry
    @station_name = station_atts[:station_name]
  end

end
