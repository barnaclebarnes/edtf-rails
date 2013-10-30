$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require "active_record"
require "logger"
require 'edtf-rails'
require 'awesome_print'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # # Disable the `expect` sytax...
    c.syntax = :should

    # ...or disable the `should` syntax...
    c.syntax = :expect

    # # ...or explicitly enable both
    c.syntax = [:should, :expect]
  end
end

EdtfRailsTest.connect_to_database