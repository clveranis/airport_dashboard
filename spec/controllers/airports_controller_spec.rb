require 'rails_helper'

RSpec.describe AirportsController, type: :controller do
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
end
