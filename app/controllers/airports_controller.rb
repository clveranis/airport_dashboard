class AirportsController < ApplicationController
  
  def search
    respond_to do |format|
      format.js {
        render 'airports/search', airport_code: params[:iata_code]
      }
    end
  end
  
  def index
    @airports = Airport.where(show_on_dashboard: true)
    respond_to do |format|
      format.html
      format.js {
        render 'airports/airport_display'
      }
    end
  end
  
end
