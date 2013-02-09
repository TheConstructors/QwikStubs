require 'spec_helper'

describe ApplicationModel do
  class A < ApplicationModel
  end

  it "should mix in MongoMapper::Document" do
    a = A.new
    a.should.is_a?(MongoMapper::Document)
  end

  it "should set safe mode" do
    base_class = ApplicationModel
    class << base_class
      attr_reader :safe_called

      def safe
        @safe_called = true
      end
    end

    a_class = Class.new(base_class)
    a = a_class.new
    a.class.safe_called.should.== true
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
