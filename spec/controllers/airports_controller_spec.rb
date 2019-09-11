require 'rails_helper'

RSpec.describe AirportsController, type: :controller do
  before do
    @airport = Airport.create(id: 1, iata_code: "BDL")
  end
  
  describe "GET index" do
    it "successfully responds to html request and loads template" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
    
    it "successfully responds to ajax request and loads template" do
      get :index, xhr: true
      expect(response.status).to eq(200)
      expect(response).to render_template("airports/airport_display")
    end
  end

  describe "GET search" do
    it "successfully responds to ajax request and loads template" do
      get :search, xhr: true
      expect(response.status).to eq(200)
      expect(response).to render_template(:search)
    end
  end
  
  # describe "PUT update_or_create" do
  #   it "successfully PUT and redirects" do
  #     params = { ap_params: { iata_code: "BDL" } }
  #     put :update_or_create, { params: params.to_json, xhr: true }
  #     expect(response.status).to eq(302)
  #     expect(response).to redirect_to(airports_path)
  #   end
  # end

  describe "GET refresh_data" do
    it "successfully responds to ajax request and loads template" do
      get :refresh_airport_data, params: { iata_code: "BDL" }, xhr: true
      expect(response.status).to eq(200)
      expect(response).to render_template(:search)
    end
  end

  describe "GET dashboard_remove" do
    it "successfully gets and redirects" do
      get :dashboard_remove, params: { id: 1 }, xhr: true
      expect(response.status).to eq(302)
      expect(response).to redirect_to(airports_path)
    end
  
    it "successfully sets show_on_dashboard to false" do
      expect(@airport.show_on_dashboard).to be_falsey
    end
  end
  
end
