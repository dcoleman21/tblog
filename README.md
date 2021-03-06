# README

This is a simple rails application implementing CRUD functionality for a blog/article based application. This app allows a user to see all articles that they have written, create a new article, update/edit an existing article and delete and article. 

## Table of Contents
- [Setup](#setup)
- [My Process](#my-process)
- [TDD](#tdd)

## Setup

### Prerequisites

- Ruby 2.5
- Rails 5.2.x

## My Process:

Step 1: run the following in the command line

```
rails new task_manager -T -d="postgresql" --skip-spring --skip-turbolinks
```
Step 2: Your project folder structure should look like the following:

<p align="center">
  <img src="https://i.imgur.com/dHXvRD4.png?1" title="source: imgur.com" />
</p>

we are primarily paying attention to the following files:
* *app* - This is where our MVC structure lives.
* *config* - Inside this directory, in the routes.rb file is where we will tell our Rails app which HTTP requests to respond to.
* *db* - Where our database structure will be set up.

Step 3: Add the following to your Gemfile: (they should look like the below references)

```
group :developement, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'simplecov'
  gem 'shoulda-matchers'
end
```

Step 4: Run the following command:

```
bundle install
```

Step 5: Run the following command to install `rspec`

```
rails g rspec:install
```

Step 6: Add the following to the newly created `spec directory`:

Add to the `rails_helper.rb` file at the very bottom but within the block

```
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :rails
  end
end
```
  
Add to the `rails_helper.rb` file at the very top

```
require 'simplecov'
SimpleCov.start
```

Step 7: Create the database with the following command

```
rails db:create
```

Step 8: Create a model (migration) with the following command

```
rails generate model Article title:string body:text
```

I then double checked that my migration looked the way I wanted it to. 

```
class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
```

Then I ran the following command:

```
rails db:migrate
```

This created my schema with the following table:

```
ActiveRecord::Schema.define(version: 2021_02_15_161206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
end
```

## TDD

I was taught to implement Test Driven Development. So the next thing that I did was create a `features` directory withing the `spec` directory. For this one, I created `Articles` directory and within that directory I included the various tests that I felt necessary. 

To run the test suite, run the following from the command line:

all of the tests:

```
bundle exec rspec
```

a specific test:

```
bundle exec rspec spec/features/Articles/<name of file>:line number of test
```
