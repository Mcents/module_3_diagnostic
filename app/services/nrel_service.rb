class NrelService
  
  attr_reader :tokken, :conn, :zip

  def initialize
    @conn = Faraday.new(url: "https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=1") do |faraday|
    faraday.adapter Faraday.default_adapter
    faraday.headers["X-Api-Key"] = ENV["TOKKEN"]
    end
  end

  def station_info
   parse(conn.get("#{zip}")) 
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
