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
    ignore_urls: [/\#$/, /localhost/, /rubydoc/, /viewdns/, /paypalme/],
    ignore_files: [/slides/],
    allow_hash_href: true,
    check_favicon: true,
    ignore_status_codes: [999, 503, 400, 429, 0],
    typhoeus: {
      ssl_verifyhost: 0,
      ssl_verifypeer: false,
      timeout: 30,
      connecttimeout: 10,
      followlocation: true,
    },
    swap_urls: { /^https:\/\/phansch.net/ => '' }
  }
  HTMLProofer.check_directory('public', opts).run
end
