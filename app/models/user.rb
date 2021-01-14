class User < ApplicationRecord
  has_many :events, class_name: "Event", foreign_key: "host_id"
end
