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
  end
  
  describe "airport" do
    it "saves and creates new airport" do
      airport = Airport.create(@airport_attributes)
      expect(airport).to be_present
    end
  end
  
end
