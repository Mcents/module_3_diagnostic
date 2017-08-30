require 'rails helper'

describe NrelService do 
  context "#station_info" do
    it "retrieves info for stations" do
      

      station_info = NrelService.new.station_info

      expect(station_info.class).to eq(Hash)
    end
  end
end
