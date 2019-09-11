# Airport Dashboard

### Non-Technical Description
This dashboard was created to view data about a given airport such as weather and time. Users
can use the search feature located on the top bar by entering the 3 character Airport IATA Code. Users can
manually refresh airport data by clicking on the "Refresh Data" button as well as remove an airport from the 
dashboard by clicking on the "Remove" button, both located on the bottom right of the airport card. Users are alerted
of the success or failure (such as entering an invalid IATA Code) for all actions via a flash notification at the
top of the screen. 

### Technical Description
The dashboard uses an Airport's `iata_code` to retrieve relevant weather data on the desired airport 
directly from the National Weather Service API endpoint. It has one model, `Airport`, with the `airports#index` action
serving as the main homepage and dashboard. The search form at the top of the page uses AJAX 
to submit the data to `airports#search`, which renders `search.js.erb`, uses AJAX to call the endpoint
with the user input, then either submits the data back to the controller via AJAX to either update or create 
a new `Airport` object or it displays an error notification. Upon success, the `update_or_create` action
re-renders the page displaying the added Airport data.

### Assumptions
After looking at the different endpoints available from the National Weather Service, I
assumed that the endpoint holding the requested weather data had to come from `/K___/observations/latest`.

# Setup
 To get started with the app, clone the repo and then install the needed gems:
 
 ```
 $ bundle install
 ```
 
 Next, create and migrate the database (the app uses MySQL by default so be sure to have that installed/available):
 
 ```
 $ rails db:create
 $ rails db:migrate
 ```
 
 This app uses Rspec/Capybara for testing so to verify that everything is working correctly run:
 
 ```
 $ bundle exec rspec
 ```
 
 If the test suite passes, you'll be ready to run the app in a local server:
 
 ```
 $ rails server
 ```

# Misc. Notes

The default database login contained within `database.yml` uses an environmental variable as follows:
```
user: rails
password: <%= ENV['RAILS_DB'] %>
```
Please add this variable to the environment running this app or adjust the `database.yml` file accordingly.


If you feel that you need to create a production database, please run:
```
$ RAILS_ENV=production rails db:create
``` 