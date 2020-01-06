#!/usr/bin/env ruby
# frozen_string_literal: true

# Run different build jobs and deal with the job results
class Build
  def initialize
    @results = {}
  end

  def run_job(job_name, command)
    puts heading("Running #{job_name}")
    @results[job_name] = system(command)
  end

  def heading(text)
    "\n\e[1;33m[Travis CI] #{text}\e[m\n"
  end

  def handle_results
    failures = @results.reject { |_, value| value }
    puts
    if failures.empty?
      puts 'Build finished successfully'
      exit(true)
    else
      puts "Build FAILED because of #{failures.map(&:first).join(', ')}"
      exit(false)
    end
  end
end

build = Build.new

if ENV['RUN'] == 'html_proofer'
  build.run_job('html_proofer', 'bundle exec rake html_proofer')
end

if ENV['RUN'] == 'test'
  build.run_job('test', 'bundle exec rake test')
  build.run_job('codespell', 'codespell _posts --skip "2012-05-18*.md","2009*.md","2010*.md","2011*.md" -L mut')
end

build.handle_results
