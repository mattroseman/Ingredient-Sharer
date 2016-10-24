# Ingredient-Sharer
A web app for sharing ingredients with neighbors.

Software Interfaces:
google maps distance matrix api
- https://developers.google.com/maps/documentation/distance-matrix/intro

# Requirements

- Ruby (2.3.0)
- Node.js

# How to run

1. clone this repository.

```
$ git clone git@github.com:mroseman95/Ingredient-Sharer.git
```

2. connect to mysql server

go into config/database.yml and fill in appropriate mysql server connection information

3. create database

```
bin/rake db:create
bin/rake db:migrate RAILS_ENV=development
```

4. go into the folder and run rails server.

```
$ cd Ingredient-Sharer/
$ bundle install
$ rails server
```

5. go to http://localhost:3000/

## Issues