# Ingredient-Sharer
A web app for sharing ingredients with neighbors.

Software Interfaces:
google maps distance matrix api
- https://developers.google.com/maps/documentation/distance-matrix/intro

# How to run

clone this repository.

```
$ git clone git@github.com:mroseman95/Ingredient-Sharer.git
```

go into the folder and run rails server.

```
$ cd Ingredient-Sharer/
$ bundle install
$ rails server
```

go to http://localhost:3000/

## Issues

1. MySQL issue: You must [configure MySQL password in the `config/database.yml` file](https://github.com/hunj/Ingredient-Sharer/blob/master/config/database.yml#L17) (if there is any error). Put MySQL root account's password for `password` (Will have to see if we can use an account that is not root).
