+++
template = "post.html"
title = "Testing your Jekyll Website with Capybara"
aliases = ["2017/03/13/testing-jekyll-websites/"]

[extra]
excerpt = "Make sure your blog keeps working!"
+++

Even when it is just a static website like this one, it is always good to know that the most important things work.

I recently had problems when I was migrating this blog from Jekyll 2.5 to Jekyll 3.3. The permalinks were broken after the upgrade and I only noticed this after the change went live. Some basic tests could have easily prevented this.

After I fixed the broken permalinks I decided to add some basic Capybara tests, as I write them day-to-day for Ruby on Rails apps, too.

## The setup
The setup is pretty basic for now with `capybara`, `rack`, `rake` and most importantly `rack-jekyll`:

```ruby
# Gemfile
source 'https://rubygems.org'

gem 'jekyll', '3.3.1'

group :test do
  gem 'capybara'
  gem 'rack'
  gem 'rack-jekyll'
  gem 'rake'
end
```

The `test_helper` tells `Capybara.app` to use `Rack::Jekyll` to serve a Rack version of our Jekyll site for our tests.

```ruby
# test/test_helper.rb
require 'minitest/autorun'

require 'bundler/setup'
require 'capybara/dsl'
require 'rack/jekyll'

Capybara.app = Rack::Jekyll.new(force_build: true)

class CapybaraTestCase < MiniTest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
```

With the `test_helper` configured we can now start writing Capybara tests as usual:

```ruby
# test/features/this_blog_post_test.rb
require 'test_helper'

class ThisBlogPostTest < CapybaraTestCase
  def test_describes_how_to_write_tests
    visit '2017/03/02/testing-jekyll-websites/'
    assert page.has_content?('configured we can now start '\
      'writing Capybara tests as usual:')
  end
end
```

## What to test
This of course depends on your website. For me I identified a few things:

* The [frontpage](/) (which is a bit outdated) should have the link to my [CV](https://github.com/phansch/cv/raw/main/resume-philipp-hansch.pdf)
* Clicking on the archive link should bring me to the archive
* [/archive](/archive) should contain the first and last post
* The dates on [/archive](/archive) should be in the correct format
* The 'Read more' link on [/writing](/writing) should bring me to the correct blog post
* A blog post should have the correct time to read
* A blog post should have its date in the correct format
* The main navigation items go to pages with the correct content
* The [atom feed](/atom.xml) should be a valid atom feed

Apart from the atom feed validation this is all straight Capybara using `has_content` and some basic Ruby for the time check. You can find all the tests [here](https://github.com/phansch/phansch.github.com/tree/main/test/).
