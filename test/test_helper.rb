require 'minitest/autorun'

require 'bundler/setup'
require 'capybara/dsl'
require 'rack/file'
require 'html-proofer'

Capybara.app = Rack::File.new File.dirname __FILE__

class CapybaraTestCase < MiniTest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

def before_run
  before = Time.now
  puts 'Building site..'
  `jekyll build -d test/_site -V` unless File.directory?('test/_site')
  puts "Finished building site in #{Time.now - before}s\n\n"
  opts = {
    url_ignore: [/localhost/],
    empty_alt_ignore: true,
    file_ignore: [/slides/]
  }
  HTMLProofer.check_directory('test/_site', opts).run
end

before_run

MiniTest.after_run do
  `rm -rf test/_site`
end
