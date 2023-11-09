require 'rake/testtask'
require 'html-proofer'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.libs << 'test' # here is the test_helper
  t.pattern = 'test/**/*_test.rb'
end

task default: :test

task :html_proofer do
  `zola build` unless File.directory?('public')
  opts = {
    url_ignore: [/\#$/, /localhost/, /rubydoc/, /viewdns/, /paypalme/],
    file_ignore: [/slides/],
    allow_hash_href: true,
    check_favicon: true,
    check_html: true,
    http_status_ignore: [999, 503, 400, 429, 0],
    typhoeus: {
      ssl_verifyhost: 0,
      ssl_verifypeer: false,
      timeout: 30,
      connecttimeout: 10,
      followlocation: true,
    },
    url_swap: { /^https:\/\/phansch.net/ => '' }
  }
  HTMLProofer.check_directory('public', opts).run
end
