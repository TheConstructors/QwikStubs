class EventSection
  include MongoMapper::Document

  key :price, Float

  # validations
  validate :price, :presence => true

  before_save :validate_event_and_section_unique

  #relationships
  belongs_to :event
  belongs_to :section
  has_many :event_seat

  def validate_event_and_section_unique
    EventSection.where(event_id: event.id, section_id: section.id).blank?
  end
end
