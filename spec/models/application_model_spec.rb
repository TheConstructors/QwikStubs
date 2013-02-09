require 'spec_helper'

describe ApplicationModel do
  class A < ApplicationModel
  end

  it "should mix in MongoMapper::Document" do
    a = A.new
    a.should.is_a?(MongoMapper::Document)
  end

  it "should set safe (:w => 1) mode" do
    a = A.new
    a.class.connection.write_concern[:w].should.== 1
  end

  it "should create timestamps!" do
    base_class = ApplicationModel
    class << base_class
      attr_reader :timestamps_set

      def timestamps!
        @timestamps_set = true
      end
    end

    a_class = Class.new(base_class)
    a = a_class.new
    a.class.timestamps_set.should.== true
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

    it "should just log the exception" do
      logger = mock(:logger)
      logger.should_receive(:warning).with(/Exception from ensure_index/)
      ApplicationModel.stub(:logger).and_return(logger)

      lambda do
        class EnsureIndexDocumentTest < ApplicationModel
          ensure_index "name"
        end
      end.should_not raise_error(ArgumentError)
    end
  end
end
