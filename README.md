# Mokomukas Backend

*Mokomukas* is a web application which teaches users safe internet usage. Users can do tasks about:

- phishing emails,
- phishing websites,
- manipulation,
- fake social media accounts.

This repository is the backend of the application. The frontend can be found [here](https://github.com/aauga/mokomukas-frontend).

## Prerequisites

- Ruby 3.3.0
- Ruby on Rails 7.1.3.2
- MySQL
- Sidekiq

## Setting up the project

1. Clone the repository
2. Change database configuration in `config/database.yml` to match your MySQL configuration
3. Run `bundle install` to install dependencies
4. Run `rails db:create` to create the database
5. Run `rails db:migrate` to run migrations

## Running the project

1. Run `rails s` to start the server
2. Run `bundle exec sidekiq` to start Sidekiq
