module EdtfRails
  module GettersAndSetters
    extend ActiveSupport::Concern

    module ClassMethods
      # def try_edtf(date)
      #   if date
      #     EDTF.parse(date.to_s) || date
      #   end
      # end

    end
  end
end