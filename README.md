# Airport Dashboard

### Technical Description

### Non-Technical Description

# Setup
 To get started with the app, clone the repo and then install the needed gems:
 
 ```
 $ bundle install
 ```
 
 Next, create and migrate the database:
 
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
user: root
password: <%= ENV['RAILS_DB'] %>
```
Please add this variable to the environment running this app or adjust the `database.yml` file accordingly.


If you feel that you need to create a production database, please run:
```
$ RAILS_ENV=production rails db:create
``` 