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
  gem.name = "edtf-rails"
  gem.homepage = "http://github.com/masciugo/edtf-rails"
  gem.license = "MIT"
  gem.summary = %Q{An ActiveRecord extension to deal with Extended DateTime Format attributes}
  gem.description = %Q{An ActiveRecord extension to deal with Extended DateTime Format attributes}
  gem.email = "masciugo@gmail.com"
  gem.authors = ["masciugo"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec, :tag) do |t, task_args|
  t.pattern = FileList['spec/**/*_spec.rb']
  t.rspec_opts = "--format documentation --color --debug"
  t.rspec_opts += " --tag #{task_args[:tag]}" unless task_args[:tag].nil?
end
# RSpec::Core::RakeTask.new(:rcov) do |spec|
#   spec.pattern = 'spec/**/*_spec.rb'
#   spec.rcov = true
# end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "edtf-rails #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
