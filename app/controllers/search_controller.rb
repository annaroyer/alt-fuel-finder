class SearchController < ApplicationController
  def index
    @stations = NrelStationService.new(params[:q]).alt_fuel_stations
  end
end
