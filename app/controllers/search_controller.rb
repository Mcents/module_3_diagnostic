class SearchController < ApplicationController

  def index
    zip = params[:search]   
    
    @conn = Faraday.new(url: "https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=1") do |faraday|
    faraday.adapter Faraday.default_adapter
    faraday.headers["X-Api-Key"] = ENV["TOKKEN"] 
    end

    response1 = @conn.get("")
    binding.pry
    @stations = JSON.parse(response.body, symbolize_names: true)[:reults] 
  end
  
end
