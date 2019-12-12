# Developer Guide

DressUp Backend project.

To run this project you need:

- Ruby 2.6.x
- Postgres +10.x
- roda 3.26.0
---

## To Start
To start development, clone the project and run:

```
$ bundle install
```

## Database setup
Update the file located in `roda_api/config/db.rb` replace the credentials and DB name with yours.

## Create the database

```ruby
rake db:create        # Create the database
rake db:drop          # Drop the database
rake db:migrate       # Perform migration up to latest migration available
rake db:migrate:down  # Perform migration down (erase all data)
rake db:migrate:up    # Perform migration up to latest migration available
```

or created the database with the pg commands

```ruby
sudo -u postgres psql
CREATE DATABASE my_development_db;
```

## Project Conventions

In `root` we have all known rails folders there from the MVC pattern, also we interduce those folders:

## Roda Console
irb -r /models.rb

## Project Configuration

#### Secrets and Keys

In this project I prefered to use [dotenv](https://github.com/bkeepers/dotenv) and keep all the keys in the env file.

- `.env.example` will used as placeholder for the required keys to run the application.
- in case there are new keys, please add a placeholder for it in `.env.example` so other developers know about it.
- use `.env` to set your own keys and your own settings based on you machine, this file is ignored from the repo, so dont push it.

#### Model style
## -------------------- Requirements -------------------- ##
## ----------------------- Scopes ----------------------- ##
## --------------------- Constants ---------------------- ##
## ----------------------- Enums ------------------------ ##
## -------------------- Associations -------------------- ##
## -------------------- Validations --------------------- ##
## --------------------- Callbacks ---------------------- ##
## ------------------- Class Methods -------------------- ##
## ---------------------- Methods ----------------------- ##

**Before Commit**

- lint ruby files by running `rubocop --auto-correct`, it will auto correct what can be corrected
- Overcommit will run automatically on commit and will show you Whitespace and Rubocop errors, and will run Rspec on push

<!-- # Notes: -->
