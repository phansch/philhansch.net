require 'minitest/autorun'

require 'bundler/setup'

require 'rack'
require 'capybara'
require 'capybara/dsl'
require 'capybara/session'

class StaticSite
  attr_reader :root, :server

  def initialize(root)
    @root = root
    @server = Rack::Files.new(root)
  end

  def call(env)
    path = env['PATH_INFO']

    # Use index.html for / paths
    if path == '/' && exists?('index.html')
      env['PATH_INFO'] = '/index.html'
    elsif !exists?(path) && exists?(path + '.html')
      env['PATH_INFO'] += '.html'
    elsif path.start_with?('/') && path.length > 1 && !path.end_with?('/') && exists?("#{env['PATH_INFO']}/index.html")
      env['PATH_INFO'] += '/index.html'
    elsif path.start_with?('/') && path.length > 2 && path.end_with?('/') && exists?("#{env['PATH_INFO']}index.html")
      env['PATH_INFO'] += 'index.html'
    end

    server.call(env)
  end

  def exists?(path)
    File.exist?(File.join(root, path))
  end
end

# Make sure the static site is built
`zola build` unless File.directory?('public')

Capybara.app = Rack::Builder.new do
  map '/' do
    use Rack::Lint
    run StaticSite.new(File.join(File.dirname(__FILE__), '..', 'public'))
  end
end.to_app

Capybara.default_driver   =  :rack_test
Capybara.javascript_driver = :webkit

class CapybaraTestCase < Minitest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
