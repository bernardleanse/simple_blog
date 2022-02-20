# Process

Started off with a simple class diagram and entity relation model

![Domain Model](domain_model.png "Domain Model")

Now to setup rakefile and database for development and test

Rake setup to create and drop the test and dev databases, and run migration 
for simple version of post table. Each step manually tested then committed.

Test drove creating posts viewing posts and editing posts using capybara to mimick a 
web browser interface, writing class methods that didn't yet exist(code I wish I had),
to then test drive these class methods which would commit to the test database as the spec
helper sets the environment and when the app.rb is required, the DatabaseConnection class instance 
variable @connection connects to the test, so whenever any query in this application is done, it will 
choose the correct database depending if it's a me in the browser, or capybara doing it through rspec. 

To Do

Set up Capybara [x]
Feature Test Post [x]
Setup DB Connection [x]
Implement delete []

implement date-time [x]
  time_cop to test this [x]
  
implement user sign-up []
implement user_id to each post []
implement each post having author name []
implement comments []

# How to use

Make sure you have the latest ruby and you have installed PostgreSQL

```
  bundle install
  rake create_databases
  rake migrate
```