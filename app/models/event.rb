class Event < ApplicationRecord
  has_many :event_attendings, class_name: "EventAttending", foreign_key: "attended_event_id"
  has_many :attendees, through: :event_attendings, source: :event_attendee
  belongs_to :user, class_name: "User", foreign_key: "host_id"

  scope :past, -> { where("time < ?", Date.current) }
  scope :upcoming, -> { where("time >= ?", Date.current) }
end
