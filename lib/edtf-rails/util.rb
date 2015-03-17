require 'active_support/concern'

module EdtfRails
  module Util
    extend ActiveSupport::Concern

    module ClassMethods

      def check_edtf_options(options, admitted_keys)

        raise WrongArgumentException, "first argument must be in a hash." unless options.is_a? Hash
        raise WrongArgumentException, "seconf argument must be in an array." unless admitted_keys.is_a? Array

        options.each do |key, value|
          unless admitted_keys.include? key
            raise WrongOptionException.new("Unknown option: #{key.inspect} => #{value.inspect}.")
          end
          if block_given?
            yield key, value
          end
        end

      end
      
    end

  end
end