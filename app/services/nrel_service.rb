class NrelService
  
  attr_reader :tokken, :conn

  def initialize
    @tokken = ENV["TOKKEN"]
    @conn = Faraday.new(url: "https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=1")
    faraday.adapter Faraday.default_adapter
    faraday.params[:access_token] = tokken
  end
end
