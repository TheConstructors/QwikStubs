class ApplicationModel
  include MongoMapper::Document

  class << self
    def inherited(derived_class)
      derived_class.instance_eval do
        safe

        timestamps!
      end

      def self.ensure_index(*args)
        super
      rescue => ex
        logger.warning("Exception from ensure_index:: #{ex.class.name}:#{ex}")
      end
    end

    def logger
      Rails.logger
    end
  end
end
