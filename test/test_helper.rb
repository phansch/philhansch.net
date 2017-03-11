require 'minitest/autorun'

require 'bundler/setup'
require 'capybara/dsl'
require 'rack/jekyll'
require 'html-proofer'

Capybara.app = Rack::Jekyll.new(force_build: true, destination: File.join(File.dirname(__FILE__), '_site'))

def before_run
  opts = {
    url_ignore: [/localhost/],
    empty_alt_ignore: true,
    file_ignore: [/slides/]
  }
  HTMLProofer.check_directory(build_dir, opts).run
end

before_run

class CapybaraTestCase < MiniTest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
