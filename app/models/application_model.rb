module ApplicationModel
  extend ActiveSupport::Concern
  include MongoMapper::Document

  included do
    safe

    timestamps!
  end

  module ClassMethods
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
