class NrelService
  
  attr_reader :tokken, :conn

  def initialize
    @tokken = ENV["TOKKEN"]
    @conn = Faraday.new(url: "https://api.data.gov/nrel/alt-fuel-stations/v1") do |faraday|
    faraday.adapter Faraday.default_adapter
    faraday.params[:access_token] = tokken
    end
  end

  def station_info
   parse(conn.get("")) 
   binding.pry
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
