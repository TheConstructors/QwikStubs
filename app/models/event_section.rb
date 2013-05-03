class EventSection
  include ApplicationModel

  key :price, Float, :default => 20 

  validate :price, :presence => true

  before_save :validate_event_and_section_unique

  belongs_to :event
  belongs_to :section
  has_many :event_seats

  def validate_event_and_section_unique
    EventSection.where(event_id: event.id, section_id: section.id).blank?
  end
end
