# Ingredient-Sharer
A web app for sharing ingredients with neighbors.

## Index

1. Requirements
2. How to run
3. Testing with `rspec`
4. Testing with `Capybara`

# Requirements

- Ruby (2.3.0)
- Node.js
- MySQL

# How to run

1. Clone this repository.

   ```shell
   $ git clone git@github.com:mroseman95/Ingredient-Sharer.git
   ```

2. Connect to MySQL server:

   1. Make sure MySQL is installed

   ```shell
   $ mysql --version
   ```

   2. If MySQL is not installed, follow the [guides to install MySQL](http://dev.mysql.com/doc/refman/5.7/en/installing.html)

3. Setup MySQL settings:

   1. In `config/database.yml`, fill in appropriate MySQL server connection information

4. Create database

   ```shell
   $ bin/rake db:create
   $ bin/rake db:migrate RAILS_ENV=development
   ```

5. Go into the folder, check dependencies with Bundler and run the server.

```
$ cd Ingredient-Sharer/
$ bundle install
$ rails server
```

5. Go to [http://localhost:3000/](http://localhost:3000/)

## Testing with `rspec`

`rspec` is a unit testing gem for Ruby. It should be automatically installed upon running `bundle install`.

To run specs (unit tests), simply run the following:

```shell
$ rspec
```

## Testing with `Capybara`

TODO add contents


## Issues

