class NrelStationService
  def initialize(zipcode)
    @options = "api_key=#{ENV['NREL-API-KEY']}&location=#{zipcode}&fuel_type=ELEC,LPG&limit=10"
  end

  def alt_fuel_stations
    get_alt_fuel_stations[:fuel_stations].map do |raw_station|
      Station.new(raw_station)
    end
  end

  private
    attr_reader :options

    def get_alt_fuel_stations
      NrelService.get_url("alt-fuel-stations/v1/nearest.json?#{options}")
    end
end
