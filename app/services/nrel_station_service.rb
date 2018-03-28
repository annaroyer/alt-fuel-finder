class NrelStationService
  def self.get_alt_fuel_stations(zipcode)
    NrelService.get_alt_fuel_stations(zipcode)[:fuel_stations].map do |raw_station|
      Station.new(raw_station)
    end
  end
end
