class User < ApplicationRecord
  has_many :event_attendings, class_name: "EventAttending", foreign_key: "event_attendee_id"
  has_many :attended_events, through: :event_attendings
  has_many :events, class_name: "Event", foreign_key: "host_id"
end
