class CreateEventAttendings < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendings do |t|
      t.references :attended_event, references: :event 
      t.references :event_attendee, references: :user

      t.timestamps
    end
  end
end
