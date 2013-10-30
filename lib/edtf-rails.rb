require "edtf"
# require File.join(File.expand_path(File.dirname(__FILE__)), 'edtf-rails/constants')
# require File.join(File.expand_path(File.dirname(__FILE__)), 'edtf-rails/exceptions')
require File.join(File.expand_path(File.dirname(__FILE__)), 'edtf-rails/getters_and_setters')
require File.join(File.expand_path(File.dirname(__FILE__)), 'edtf-rails/edtf-rails')

ActiveRecord::Base.send :extend, EdtfRails
