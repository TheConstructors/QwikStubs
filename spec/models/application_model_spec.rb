require 'spec_helper'

describe ApplicationModel do
  class Model
    include ApplicationModel
  end

  it "should mix in MongoMapper::Document" do
    m = Model.new
    m.should.is_a?(MongoMapper::Document)
  end

  it "should set safe (:w => 1) mode" do
    m = Model.new
    m.class.connection.write_concern[:w].should.== 1
  end

  it "should create timestamps!" do
    class CreateTimestamps
      class << self
        attr_reader :timestamps_set

        def timestamps!
          @timestamps_set = true
        end
      end

      include ApplicationModel
    end

    CreateTimestamps.timestamps_set.should.== true
  end

  context "when ensure_index raises an exception" do
    before do
      module MongoMapper::Plugins::Indexes::ClassMethods
        alias original_ensure_index ensure_index
        def ensure_index
          raise ArgumentError, "Error from Mongo"
        end
      end
    end

    after do
      module MongoMapper::Plugins::Indexes::ClassMethods
        alias ensure_index original_ensure_index
      end
    end

    it "should just log exception from ensure_index" do
      class EnsureIndexDocumentTest
        include ApplicationModel
      end

      lambda do
        logger_mock = mock(:logger)
        logger_mock.should_receive(:warning) .with(/Exception from ensure_index/)
        EnsureIndexDocumentTest.stub(:logger).and_return(logger_mock)

        EnsureIndexDocumentTest.instance_eval do
          ensure_index "name"
        end

      end.should_not raise_error(ArgumentError)
    end
  end
end
