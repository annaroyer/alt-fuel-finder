class SearchController < ApplicationController
  def index
    @zipcode = params[:q]
    @stations = NrelStationService.get_alt_fuel_stations(@zipcode)
  end
end
