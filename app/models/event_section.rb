class EventSection
  include MongoMapper::Document

  key :price, Float

  # validations
  validate :price, :presence => true

  before_save :both_unique

  #relationships
  belongs_to :event
  belongs_to :section
  many :event_seat

  def both_unique
    nil == EventSection.find(event_id: event.id, section_id: section.id)
  end
end
