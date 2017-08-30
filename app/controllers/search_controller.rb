class SearchController < ApplicationController

  def index
    zip = params[:search]   
    
    @conn = Faraday.new(url: "https://api.data.gov/nrel/alt-fuel-stations/v1") do |faraday|
    faraday.adapter Faraday.default_adapter
    faraday.headers["X-Api-Key"] = ENV["TOKKEN"] 
    end

    response1 = @conn.get("nearest.json?location=#{zip}&limit=10")

    @stations = JSON.parse(response1.body, symbolize_names: true) 
    @final = @stations.map do |st|
      StationInfo.new(st)
    end
  end
end
  
