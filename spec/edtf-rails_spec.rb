require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "*** Model and table settings ***" do

  before(:each) do
    EdtfRailsTest.define_test_model_class(edtf_opts)
  end

  describe 'model with edtf options: :attributes => :dob' do

    let(:edtf_opts) { {:attributes => :dob} }

    it "has :dob in its edtf attributes list" do
      EdtfRailsTest::Model.edtf_attributes.should include(:dob)
    end

    it "should have a db column named dob" do
      EdtfRailsTest::Model.column_names.should include('dob')
    end
    
  end

  describe 'model with edtf options: :attributes => [:dob,:dod]' do

    let(:edtf_opts) { {:attributes => [:dob,:dod]} }

    [:dob,:dod].each do |attr|

      it "has #{attr} in its edtf attributes list" do
        EdtfRailsTest::Model.edtf_attributes.should include(attr)
      end

      it "should have a db column named #{attr}" do
        EdtfRailsTest::Model.column_names.should include(attr.to_s)
      end

    end

  end

end

describe EdtfRails do
  describe 'EdtfRails::EDTF_STRING_FORMAT' do
    # expect(EdtfRails::EDTF_STRING_FORMAT).to be(/\d{4}(-\d{2}(-\d{2})?)?/)
    [
      '2000-12-12',
      '2000-12-01',
      '2000-12',
      '2000-01',
      '2000',
    ].each do |date|
      specify {expect(EdtfRails::EDTF_STRING_FORMAT).to match(date)}
    end
    [
      '2000-12-1',
      '2000-2-01',
      '2000-2',
      '97-01-02',
      '1997-',
    ].each do |date|
      specify {expect(EdtfRails::EDTF_STRING_FORMAT).not_to match(date)}
    end
    [
      '2000-13-10',
      '2000-12-99',
      '2000-30-60'
    ].each do |date|
      specify {expect(EdtfRails::EDTF_STRING_FORMAT).not_to match(date)}
    end

  end

end

EdtfRailsTest.define_test_model_class({:attributes => [:dob,:dod]})
describe EdtfRailsTest::Model, :wip => true do

  before(:each) do
    EdtfRailsTest.define_test_model_class({:attributes => described_class.edtf_attributes}) #define model again so that the underline table get recreated with the correct columns
    @obj = described_class.new(params)
  end

  subject { @obj }

  describe "#new" do
    context "when initialized with no params" do
      let(:params) { nil }
      specify { should be_valid }
      its(:dob) {should be_nil }
      its(:dod) {should be_nil }
      describe "#dob=new_date" do
        before(:each) do
          @obj.dob = new_date
          @obj.save!
        end

        shared_examples "getters return a Date object but a string is stored in the db" do
          describe "#dob" do
            subject { @obj.dob }
            specify { should be_a Date }
          end
          it "has a string as value in the db" do
            expect(@obj.read_attribute(:dob)).to be_a String
          end
        end
        context "when new_date is a Date object: Date.today" do
          let(:new_date) { Date.new(2001,9,10) }
          it_should_behave_like "getters return a Date object but a string is stored in the db"
          specify { expect(@obj.dob).to eql Date.new(2001,9,10) }
        end
        context "when new_date is a String object: Date.today.to_s" do
          let(:new_date) { '2001-09-10' }
          it_should_behave_like "getters return a Date object but a string is stored in the db"
          specify { expect(@obj.dob).to eql Date.new(2001,9,10) }
        end
        context "when new_date is a String object: Date.today.to_s" do
          let(:new_date) { '2001-09' }
          it_should_behave_like "getters return a Date object but a string is stored in the db"
          specify { expect(@obj.dob.precision).to be :month }
        end



      end
    end
    context "when initialized with" do
      context "inaccurate dob 1995" do
        let(:params) { {:dob => "1995" } }
        specify { should be_valid }
      end
      context "inaccurate dob 1995-11" do
        let(:params) { {:dob => "1995-11" } }
        specify { should be_valid }
      end
      context "unadmitted dob 2001-03-35" do
        let(:params) { {:dob => "2001-03-35" } }
        specify { should_not be_valid }
      end
      context "dob 2001-03-25"do
        let(:params) { {:dob => "2001-03-25" } }
        specify { should be_valid }
        context "and unadmitted dod 2001-99-25" do
          let(:params) { {:dob => "2001-03-25",:dod => "2001-99-25" } }
          specify { should_not be_valid }
        end
        context "and dod 2013-11" do
          let(:params) { {:dob => "2001-03-25",:dod => "2013-11" } }
          its(:dod) {should be_a Date }
          its(:dob) {should be_a Date }
          describe "dob precision" do
            specify { expect(@obj.dob.precision).to be :day  }
          end
          describe "dod precision" do
            specify { expect(@obj.dod.precision).to be :month  }
          end
        end
      end
    end
  end

end
