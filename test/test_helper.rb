require 'minitest/autorun'

require 'bundler/setup'
require 'capybara/dsl'
require 'rack/jekyll'

build_dir = File.join(File.dirname(__FILE__), '_site')
Capybara.app = Rack::Jekyll.new(force_build: true, destination: build_dir)

class CapybaraTestCase < MiniTest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
