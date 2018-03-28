class SearchController < ApplicationController
  def index
    @zipcode = params[:q]
  end
end
