module EdtfRailsTest

  def self.connect_to_database
    config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
    ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
    ActiveRecord::Base.establish_connection(config['sqlite3'])
  end

  def self.define_test_model_class edtf_attributes_opts = {}
    model = Class.new(ActiveRecord::Base) do
      self.table_name = 'test_records'

      edtf edtf_attributes_opts

      attr_accessible(:name) if EdtfRails::USE_ATTRIBUTE_ACCESSIBLE

      def inspect
        "#{name }"
      end

    end

    remove_const(:Model) if defined?(self::Model)
    self.const_set 'Model', model
    
    cn = ActiveRecord::Base.connection
    cn.drop_table 'test_records' if cn.table_exists?('test_records')

    cn.create_table 'test_records' do |table|
      table.string :name
      model.edtf_attributes.each do |a|
        table.string a
      end
    end

    self::Model.reset_column_information
  end
end

