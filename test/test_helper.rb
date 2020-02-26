require 'minitest/autorun'

require 'bundler/setup'
require 'capybara/dsl'
require 'rack/jekyll'

Capybara.app = Rack::Jekyll.new(destination: "_testsite")

class CapybaraTestCase < MiniTest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
