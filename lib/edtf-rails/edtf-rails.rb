require 'active_support/concern'

module EdtfRails
  
  extend ActiveSupport::Concern

  module ClassMethods

    def edtf options = {}

      admitted_keys = [:attributes]
      
      include Util
      check_edtf_options(options, admitted_keys)

      class_attribute :edtf_attributes
      self.edtf_attributes = [options[:attributes]].flatten

      validates_format_of edtf_attributes, :with => EDTF_STRING_FORMAT, :allow_nil => true

      edtf_attributes.each do |d|

        attr_accessible(d.to_sym) if USE_ATTRIBUTE_ACCESSIBLE
        
        # getters
        define_method(d) do
          # read_attribute(d) && (EDTF.parse(read_attribute(d)) || read_attribute(d)) #if the format is not EDTF compatible the string will be returned (validation call this getter and need a value)
          EDTF.parse(read_attribute(d)) || read_attribute(d)
        end

        # virtual attributes dob_y, dob_m....
        [:y, :m, :d].each do |xx|
          attr_accessor "#{d}_#{xx}"
          attr_accessible("#{d}_#{xx}".to_sym) if USE_ATTRIBUTE_ACCESSIBLE
        end 

        # setters
        define_method("#{d}=") do |edtf_date|
          edtf_date = edtf_date.edtf if edtf_date.is_a? Date
          transaction do

            write_attribute(d,edtf_date)
            
            # virtual attributes settings after any assignment (including initialization)
            date_array = read_attribute(d).to_s.split('-')
            [:y, :m, :d].each_with_index do |x,i|
              send("#{d}_#{x}=",date_array[i])
            end
          
          end
        end
        
      end

      # virtual attributes utilization to set date before validation (they are used only if at least one of them is defined)
      before_validation do
        edtf_attributes.each do |d|
          date_array = [:y, :m, :d].map{|x| send("#{d}_#{x}")}
          self[d]= if (res = date_array.shift).present? #they are used only if at least one of them is defined
            date_array.each{|x| x.blank? ? break : (res += "-#{x}") }
            res
          else
            nil
          end
        end
      end

      # virtual attributes settings after any initialization
      after_initialize do
        unless new_record?
          edtf_attributes.each do |d|
            date_array = read_attribute(d).to_s.split('-')
            [:y, :m, :d].each_with_index do |x,i|
              send("#{d}_#{x}=",date_array[i])
            end
          end
        end
      end

    end

  end


end
