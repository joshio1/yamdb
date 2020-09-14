# yamdb
Yet Another Movie Database!

## Dev Environment:

### Prerequisites

* Ruby (version specified in the gemfile)
* Bundler (Both Ruby and Bundler must be on the PATH)
* Postgres

### Steps:

* Clone this repository using SSH or HTTP.
* Copy database.yml.sample to database.yml and secrets.yml.sample to secrets.yml by running these commands:

    ```shell script
    cp config/database.yml.sample config/database.yml && cp config/secrets.yml.sample config/secrets.yml
    ```
* Replace `YOUR_TMDB_KEY` with your TMDB API KEY in secrets.yml
* Run `bundle install` to download all the gems specified in the Gemfile
* Run `bundle exec rails db:setup` to create development database, test database and run seeds on development database.
    * At this point, you should be able to enter into the rails console by running `bundle exec rails c`
    * Similarly, you should be able to login into the Postgres console using `bundle exec rails db`
    * If you have `rails` on you PATH, you should be able to run the above commands directly using `rails` without the bundle context. For eg. `rails c`
* Setup `pre-commit` hooks using these commands:
    * `pip install pre-commit`
    * `pre-commit install`
    * Now, whenever you commit anything, `pre-commit` checks will be run automatically.
    
### Execute Unit Tests

* Run `bundle exec rspec spec` to run the Rspec tests.

### TODO

* Currently, the tests hit the real API using the real token. 
It'll be a good idea to mock the external API and have the tests hit this mock.

* External API does not have a BULK endpoint which takes a list of movies and returns certifications.
Hence, currently, we are doing an N+1 to find certifications for every movie in the list. 
It'll probably be a good idea to have some sort of caching if this becomes network intensive.