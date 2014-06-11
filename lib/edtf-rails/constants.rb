module EdtfRails

  EDTF_STRING_FORMAT = /\A(\d{4})$|^(\d{4}-(0[1-9]|1[012]))$|^(\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01]))\z/
  
  USE_ATTRIBUTE_ACCESSIBLE = Gem::Specification.find_by_name('activerecord').version < Gem::Version.new('4')
  
end