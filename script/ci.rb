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

case ENV['RUN']
when 'html_proofer'
  build.run_job('html_proofer', 'bundle exec rake html_proofer')
when 'test'
  build.run_job('test', 'bundle exec rake test')
when 'lint'
  build.run_job('lint', 'bundle exec rake proselint')
end

build.handle_results
