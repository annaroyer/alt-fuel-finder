class SearchController < ApplicationController
  def index
    @stations = NrelStationService.get_alt_fuel_stations(params[:q])
  end
end
