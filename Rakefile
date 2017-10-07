require 'rake/testtask'
require 'html-proofer'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.libs << 'test' # here is the test_helper
  t.pattern = 'test/**/*_test.rb'
end

task default: :test

task :html_proofer do
  build_dir = File.join(File.dirname(__FILE__), '_site')
  `jekyll build -d #{build_dir} -V` unless File.directory?('test/_site')
  opts = {
    url_ignore: [/localhost/],
    empty_alt_ignore: true,
    file_ignore: [/slides/],
    ssl_verifyhost: 0,
    ssl_verifypeer: false
  }
  HTMLProofer.check_directory(build_dir, opts).run
end
