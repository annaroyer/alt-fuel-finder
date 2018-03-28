class SearchController < ApplicationController
  def index
    @zipcode = params[:q]
    @stations = NrelService.get_alt_fuel_stations(@zipcode)[:fuel_stations].map do |raw_station|
      Station.new(raw_station)
    end
  end
end
