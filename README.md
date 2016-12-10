# Ingredient-Sharer
A web app for sharing ingredients with neighbors.

## 0. Index

1. Requirements
2. How to run
3. Testing 
    - with `rspec`
    - Code Coverage
4. Issues/Notes

# 1. Requirements

- Ruby (2.3.0)
- Node.js
- MySQL

# 2. How to run

The instructions for installing relevant dependencies and resources to run ISA is described below.

### Installing dependencies for Ruby and rbenv

The first step is to install dependencies for Ruby. The following commands will update apt, the package manager in Ubuntu, then install dependencies for Ruby. Ubuntu comes with git by default.

```
$ sudo apt-get update
$ sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
```

### Installing rbenv

Rbenv is a Ruby version manager. It allows the user to pick a Ruby version for each application and guarantee that the development environment matches production.

Installing rbenv is a simple two-step process. Install rbenv, and then ruby-build as following:

```
$ cd
$ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
$ echo 'eval "$(rbenv init -)"' >> ~/.bashrc
$ exec $SHELL
```

```
$ git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
$ echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
$ exec $SHELL
```

### Setting up rbenv 

A version of Ruby must be installed in order to use Rails.

```
$ rbenv install 2.3.1
$ rbenv global 2.3.1
$ ruby -v
```

Check that the last command prints out that the Ruby version is 2.3.1.


### Cloning this repository


The repository for ISA can be cloned using git using the following command:

```
$ git clone https://github.com/mroseman95/Ingredient-Sharer.git
```

### Installing dependencies using Bundler

Bundler is a package manager for Ruby, and each application’s dependency gem list is defined in Gemfile of the root directory. Use the following command to install dependencies using Bundler:

```
$ gem install bundler
```

### `rbenv rehash`

Every time a gem is installed, it requires rbenv to create a shim for it. This is called rehashing, and the following command should be run in order to rehash.

```
$ rbenv rehash
```

### `bundle install`

Finally, all dependent gems can be installed using Bundler running on a version of Ruby that is managed by rbenv and rehashed, through the following commands:

```
$ bundle install
$ rbenv rehash
```

After all the procedure above, ISA is finally ready to launch.


## 3. Running ISA

### Create and Migrate Database

Before running the server, ISA must create the database and migrate the schema into the localhost. Database username and password must be defined in `config/database.yml` file, like below:

```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: isa
  password: p4ssw0rD?!
  host: 127.0.0.1
```

The above example is of an example of `username` of `isa` and `password` of `p4ssw0rD?!` (in blue). The following command will create a database for ISA and migrate its schema:

```
$ rake db:create
$ rake db:migrate
```

Rails keeps separate database for development, production, and test. In this case, creating three databases:

- `Ingredient-sharer_development`
- `Ingredient-sharer_production`
- `Ingredient-sharer_test`

Training data for spam detection must be loaded in the markov\_models table manually. The markov\_models.sql file is located in the root directory. Simply load the .sql file into the ingredient-sharer\_development.markov_models table using the following command:

```
$ mysql -u mysql_username -p ingredient-sharer_development < markov_models.sql
```

### Run Rails Server

Running the server, or launching ISA, can be done through the following rails command:

```
$ rails server 
```

However, this will usually run in development mode, for developers. To run in production mode, use the following:

```
$ rails server -e production
```

ISA now can be approached through http://localhost:3000.

# 4. Testing

## Testing with `rspec`

`rspec` is a unit testing gem for Ruby. It should be automatically installed upon running `bundle install`.

To run specs (unit tests), simply run the following:

```shell
$ rspec
```

To run specs and display each spec, run the following command:

```shell
$ rspec spec --format documentation
```

## Code coverage

Code coverage is handled using `simplecov`. Upon running `rspec`, simplecov will automatically generate coverage data in `/coverage/` folder.


## Issues/Notes

Issues are tracked in the repository's backlog.
