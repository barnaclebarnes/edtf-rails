require "edtf"
require File.join(File.expand_path(File.dirname(__FILE__)), 'edtf-rails/constants')
require File.join(File.expand_path(File.dirname(__FILE__)), 'edtf-rails/edtf-rails')

ActiveRecord::Base.send :extend, EdtfRails
