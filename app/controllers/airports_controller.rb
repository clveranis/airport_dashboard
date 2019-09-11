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
      # respond to html for initial page load and page refreshes
      format.html
      # respond to js to refresh display of airport cards without having to reload the entire page
      format.js {
        render 'airports/airport_display'
      }
    end
  end

  def update_or_create
    # receive json data object from search.js.erb and parse it
    airport_params = JSON.parse(params[:ap_params])
    # use custom method in airport model to search existing airports by iata_code or creating a new one if not
    @airport = Airport.update_or_create_by({iata_code: airport_params["iata_code"]}, airport_params)
    respond_to do |format|
      format.js {
        if @airport.save
          flash[:success] = "Airport data retrieved. Please view it below."
          redirect_to airports_path
        else
          flash[:danger] = "Unable retrieve airport data. Please try your code again or contact support."
          redirect_to airports_path
        end
      }
    end
  end

  def refresh_airport_data
    respond_to do |format|
      format.js {
        render 'airports/search', airport_code: params[:iata_code]
      }
    end
  end
  
end
