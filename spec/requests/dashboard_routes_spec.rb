require 'rails_helper'

RSpec.describe "DashboardRoutes", type: :request do
  
  describe "dashboard_routes" do
  
    it "gets root path" do
      get root_path
      expect(response).to have_http_status(200)
    end

    it "routes root and airports_path to airports index", :type => :routing do
      expect(get: root_path).to route_to(controller: "airports", action: "index")
      expect(get: airports_path).to route_to(controller: "airports", action: "index")
    end

    it "routes airport_search_path", :type => :routing do
      expect(get: airport_search_path).to route_to(controller: "airports", action: "search")
    end

    it "routes airport_update_or_create_path", :type => :routing do
      expect(put: airport_update_or_create_path).to route_to(controller: "airports", action: "update_or_create")
    end

    it "routes refresh_airport_data_path", :type => :routing do
      expect(get: refresh_airport_data_path("bdl")).to route_to(controller: "airports", action:"refresh_airport_data", iata_code: "bdl")
    end

    it "routes dashboard_remove_path", :type => :routing do
      expect(get: dashboard_remove_path("1")).to route_to(controller: "airports", action: "dashboard_remove", id: "1")
    end
  end
  
end
