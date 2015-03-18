require 'rspec'
require 'rspec/its'
require "active_record"
require "logger"
require 'awesome_print'

# this is to make absolutely sure we test this one, not the one
# installed on the system.
require File.expand_path('../../lib/edtf-rails', __FILE__)


# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

EdtfRailsTest.connect_to_database