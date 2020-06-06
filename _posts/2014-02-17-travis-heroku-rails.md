---
title: "Automating your deployments from Travis to Heroku"
layout: "post"
excerpt: "Setting up automated deployments from Travis to Heroku for Rails applications."
aliases: ["2014/02/17/travis-heroku-rails/"]
---

While this post might seem very concise and short, it really took some time until I was happy with the current setup.
This setup is relatively simple in retrospect, but it was hard to find any documentation on how to set everything up correctly.

This post is for people who have some basic experience with Ruby on Rails, Test Driven Development and also have a rough idea what Continuous Integration or Continuous Deployment are about.
I assume you already know how to [connect a GitHub repository with Travis](http://docs.travis-ci.com/user/getting-started/). You will also need a [Heroku](http://heroku.com) account.

The goal is to automatically deploy successful builds from Travis to Heroku.

<small>
Credit: A good part of this post was inspired by [this](http://stackoverflow.com/a/14788282/3298908) awesome Stack Overflow post.
</small>

## The problems with secrets and open source
When working on an open source project, how do you keep stuff like the Rails Secret Token an actual secret? Where do you put API keys that are required in production?
You don't want to keep passwords and otherwise secret stuff in your GitHub repository. However, at the same time it should be easy for contributors to get started quickly.

## The joy of continuous deployments
Not so long ago, people used to upload their changed files via FTP to their servers. Luckily we don't have to do that anymore. Continuous deployments allow you to automate updating your production environment. Let's see how to do this with Travis CI and Heroku.

## Local setup
Starting with the local setup, first we need to setup the `secret_token.rb` and the `database.yml`.

**config/initializers/secret_token.rb**

{% highlight ruby %}
App::Application.config.secret_key_base = ENV['SECRET_TOKEN']
{% endhighlight %}

**config/database.yml**

{% highlight yaml %}
postgresql: &postgresql
adapter: postgresql
database: <%= ENV['DB_NAME'] %>
username: <%= ENV['DB_USER'] %>
password: <%= ENV['DB_PASSWORD'] %>
min_messages: ERROR

defaults: &defaults
pool: 5
timeout: 5000
host: localhost
<<: *<%= ENV['DB'] || "postgresql" %>

development:
<<: *defaults

test:
<<: *defaults

production:
<<: *defaults
{% endhighlight %}

There are a couple things to say about this file.

 1. It is parsed by Ruby's ERB interpreter ([yes, Ruby](http://www.ruby-doc.org/stdlib-2.1.0/libdoc/erb/rdoc/ERB.html) &mdash; not Rails). This allows us to read the environment variables we will set up in the next step.
 2. We are using fancy yaml here in order to avoid repetition. Note the `*`, `&` and `<<` in there. Using `&` creates something like a constant. In yaml, this is called an anchor. We can access the value of this anchor by using the `*`.
    Finally, the `<<` inserts the content of that node.

**Enter the dotenv gem**

In order to set the environment variables on your local machine, I am using [dotenv](https://github.com/bkeepers/dotenv).
Add this gem to the top of your gemfile and run `bundle install` afterwards.

{% highlight ruby %}
gem 'dotenv-rails', :groups => [:development, :test]
{% endhighlight %}

Dotenv creates environment variables from the contents of `.env` files. This is what we need in order to manage different databases and users for our test and development environment.

The `.env` files look something like this:

    # .env.development
    SECRET_TOKEN=generate this with "rake secret"
    DB_NAME=project_development
    DB_USER=username
    DB_PASSWORD=password

There are separate files for each environment. For the test environment, specify the test database:

    # .env.test
    SECRET_TOKEN=generate this with "rake secret"
    DB_NAME=project_test
    DB_USER=username
    DB_PASSWORD=password

Don't forget to add these files to your .gitignore.

## Travis CI Setup

The travis setup is very simple. First you will have to encrypt your secret data with `travis encrypt`.

    gem install travis

    travis encrypt HEROKU_API_KEY=YOUR_HEROKU_API_KEY --add
    travis encrypt HEROKU_GIT_URL=YOUR_HEROKU_GIT_URL --add
    travis encrypt SECRET_TOKEN=YOUR_SECRET_TOKEN --add
    travis encrypt DB_NAME=YOUR_DB_NAME_UNDER_TEST --add
    travis encrypt DB_USER=YOUR_DB_USER_UNDER_TEST --add
    travis encrypt DB_PASSWORD=YOUR_DB_PASSWORD_UNDER_TEST --add

Your *Heroku API key* can be found [here](https://dashboard.heroku.com/account#api-key) and the *Heroku Git Url* can be found in the settings of your Heroku project.

**.travis.yml**

This is where the integration with Heroku is configured. In the `after_success` section we push our changes to Heroku if the build was successful.

{% highlight yaml %}
rvm:
  - 2.1.0
env:
  global:
    # your encrypted values will have been added here.
matrix:
  - DB: postgresql
before_script:
  - psql -c "create database $DB_NAME;" -U $DB_USER
  - RAILS_ENV=test bundle exec rake db:migrate
script:
  - bundle exec rspec spec/
after_success:
  - gem install heroku
  - git remote add heroku $HEROKU_GIT_URL
  # Turn off warnings about SSH keys:
  - echo "Host heroku.com" >> ~/.ssh/config
  - echo " StrictHostKeyChecking no" >> ~/.ssh/config
  - echo " CheckHostIP no" >> ~/.ssh/config
  - echo " UserKnownHostsFile=/dev/null" >> ~/.ssh/config
  - heroku keys:clear
  - yes | heroku keys:add
  - yes | git push heroku master
{% endhighlight %}

An alternative to the `after_success` section is the [deploy section](http://docs.travis-ci.com/user/deployment/heroku/). But the current solution seem to be working fine right now.

## Heroku Setup
The Heroku setup is even simpler. First, install the heroku gem:

    gem install heroku

Then set up any environment variables you need:

    heroku config:set SECRET_TOKEN=YOUR_SECRET_TOKEN
    heroku config:set DB_NAME=YOUR_DB_NAME_UNDER_PRODUCTION # eg your_app_production
    heroku config:set DB_USER=YOUR_DB_USER_UNDER_PRODUCTION
    heroku config:set DB_PASSWORD=YOUR_DB_PASSWORD_UNDER_PRODUCTION

------

**And you're done!** Now, whenever you push your changes to GitHub, the Travis build will be started. If the build was successful, the changes will automatically be pushed to Heroku.

Let me know if that worked for you as well.
