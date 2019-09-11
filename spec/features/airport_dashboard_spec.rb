require 'rails_helper'

RSpec.feature "AirportDashboards", type: :feature do
  
  describe "initial visit to dashboard" do
    it "displays navbar, search form, and jumbo info" do
      visit '/'
      expect(page).to have_selector('nav.navbar')
      expect(page).to have_field('iata_code')
      expect(page).to have_selector('div#homeJumbo')
    end
  end

  describe "airport search" do
    scenario "user searches for valid airport", js: true do
      visit '/'
      fill_in('iata_code', with: "BDL")
      click_button 'Search'
      proxy.stub('https://api.weather.gov/stations/KBDL').and_return(code: 200)
      proxy.stub('https://api.weather.gov/stations/KBDL/observations/latest').and_return(code: 200)
      expect(page).to have_selector('div#airportCard-BDL')
      expect(page).to have_selector('div.alert')
    end
  
    scenario "user searches for invalid airport", js: true do
      visit '/'
      fill_in('iata_code', with: "asdfasdf")
      click_button 'Search'
      proxy.stub('https://api.weather.gov/stations/Kasdfasdf').and_return(code: 404)
      proxy.stub('https://api.weather.gov/stations/Kasdfasdf/observations/latest').and_return(code: 404)
      expect(page).to have_selector('div.alert')
      expect(page).to have_text('Please enter a valid airport code.')
    end

    scenario "airport card has refresh and remove links", js: true do
      visit '/'
      fill_in('iata_code', with: "BDL")
      click_button 'Search'
      expect(page).to have_selector('a#refreshData-BDL')
      expect(page).to have_selector('a#remove-BDL')
    end

    scenario "user refreshes airport data", js: true do
      visit '/'
      fill_in('iata_code', with: "BDL")
      click_button 'Search'
      click_link 'Refresh Data'
      expect(page).to have_selector('div.alert')
      expect(page).to have_text('Airport data retrieved. Please view it below.')
    end

    scenario "user removes airport from dashboard", js: true do
      visit '/'
      fill_in('iata_code', with: "BDL")
      click_button 'Search'
      click_link 'Remove'
      expect(page).to have_selector('div.alert')
      expect(page).to have_text('Airport removed from dashboard.')
      expect(page).to_not have_selector('div#airportCard-BDL')
    end
  end
  
end
