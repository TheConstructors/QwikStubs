class ApplicationModel
  include MongoMapper::Document

  def self.inherited(derived_class)
    derived_class.instance_eval do
      timestamps!
    end
  end

  class << self
    def ensure_index(*args)
      super
    rescue => ex
      logger.warning("Exception from ensure_index:: #{ex.class.name}:#{ex}")
    end

    def logger
      Rails.logger
    end
  end
end
