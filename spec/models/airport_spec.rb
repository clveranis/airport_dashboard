require 'rails_helper'

RSpec.describe Airport, type: :model do
  before do
    @airport_attributes={
        name: "Windsor Locks, Bradley International Airport",
        iata_code: "BDL",
        description: "Partly Cloudy",
        temperature: 20.800000000000009,
        relative_humidity: 63.854514058555736,
        wind_speed: 4.5999999999999996,
        wind_direction: 360,
        time_zone: "America/New_York",
        long: 41.93,
        lat: -72.680000000000007,
        data_time: "2019-09-11T01:51:00+00:00",
        show_on_dashboard: true
    }
    @iata_params = { iata_code: "BDL" }
  end
  
  describe "airport" do
    
    it "saves and creates new valid airport" do
      airport = Airport.create(@airport_attributes)
      expect(airport).to be_present
    end
    
    it "searches for existing airport and creates if not found" do
      airport = Airport.update_or_create_by(@iata_params, @airport_attributes)
      expect(airport).to be_present
    end
    
    it "finds and updates existing airport" do
      Airport.create(@airport_attributes)
      @airport_attributes['description'] = "Clear"
      airport = Airport.update_or_create_by(@iata_params, @airport_attributes)
      expect(airport.description).to eq('Clear')
    end

    it "sets show_on_dashboard to false" do
      airport = Airport.new(@airport_attributes)
      airport.remove_from_dashboard
      expect(airport.show_on_dashboard).to be_falsey
    end
    
  end

  describe "airport validations" do
  
    it "is valid with iata_code" do
      airport = Airport.new(@airport_attributes)
      expect(airport).to be_valid
    end
  
    it "is not valid without iata_code" do
      airport = Airport.new(@airport_attributes)
      airport.iata_code = ""
      expect(airport).to_not be_valid
    end

  end
  
end
