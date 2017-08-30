class StationInfo
  def initialize(station_atts={})
    @station_name = st_name[:fuel_stations]
  end

  def self.station_info
    NrelService.new.station_info.map do |st|
      StationInfo.new(st)
    end
  end
end
