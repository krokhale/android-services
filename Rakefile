# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "android-services"
  gem.homepage = "http://github.com/krokhale/android-services"
  gem.license = "MIT"
  gem.summary = %Q{Ruby wrapper for the google android services.}
  gem.description = %Q{The gem aims to provide an API for google services including google play which interact with Android devices.}
  gem.email = "krishna.rokhale@gmail.com"
  gem.authors = ["krishna rokhale"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

# require 'require/rcovtask'
# Rcov::RcovTask.new do |test|
  # test.libs << 'test'
  # test.pattern = 'test/**/test_*.rb'
  # test.verbose = true
  # test.rcov_opts << '--exclude "gems/*"'
# end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "android-services #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
