class NrelService
  def self.get_alt_fuel_stations(zipcode)
    response = conn(zipcode).get
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def self.conn(zipcode)
      Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL-API-KEY']}&location=#{zipcode}&fuel_type=ELEC,LPG&limit=10")
    end
end
