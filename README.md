# Eventpriv

Invite friends to your private events!!

Project from [Odin](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations)

## Rails lessons

Run `rails generate scaffold_controller User` to add view and controller to existing models

How to set up login in vanilla rails without devise, [tutorial](https://imvishaltyagi444.wordpress.com/2018/01/19/authentication-without-devise-in-rails/)

## Create event

rails generate model Event name:string time:datetime description:text location:text

rails generate migration AddHostIDToEvents

rails generate migration CreateEventAttendings

modify the migration file

```
t.references :event
t.references :attendee, references: :user

```

Started POST "/events" for 127.0.0.1 at 2021-01-15 14:18:25 -0400
Processing by EventsController#create as HTML
Parameters: {"authenticity_token"=>"[FILTERED]", "event"=>{"name"=>"party", "location"=>"", "time(1i)"=>"2021", "time(2i)"=>"1", "time(3i)"=>"15", "time(4i)"=>"18", "time(5i)"=>"18", "description"=>""}, "commit"=>"Create Event"}
User Load (0.2ms) SELECT "users"._ FROM "users" WHERE "users"."id" = ? LIMIT ? [["id", 6], ["LIMIT", 1]]
↳ app/controllers/application_controller.rb:7:in `current_user'
CACHE User Load (0.0ms) SELECT "users"._ FROM "users" WHERE "users"."id" = ? LIMIT ? [["id", 6], ["LIMIT", 1]]
↳ app/controllers/events_controller.rb:19:in `create'
Redirected to http://localhost:3000/events
Completed 302 Found in 9ms (ActiveRecord: 0.2ms | Allocations: 3732)

Started POST "/events" for 127.0.0.1 at 2021-01-15 14:20:16 -0400
Processing by EventsController#create as HTML
Parameters: {"authenticity_token"=>"[FILTERED]", "event"=>{"name"=>"party", "location"=>"", "time(1i)"=>"2021", "time(2i)"=>"1", "time(3i)"=>"15", "time(4i)"=>"18", "time(5i)"=>"20", "description"=>""}, "commit"=>"Create Event"}
User Load (0.2ms) SELECT "users"._ FROM "users" WHERE "users"."id" = ? LIMIT ? [["id", 6], ["LIMIT", 1]]
↳ app/controllers/application_controller.rb:7:in `current_user'
CACHE User Load (0.0ms) SELECT "users"._ FROM "users" WHERE "users"."id" = ? LIMIT ? [["id", 6], ["LIMIT", 1]]
↳ app/controllers/events_controller.rb:19:in `create' TRANSACTION (0.1ms) begin transaction ↳ app/controllers/events_controller.rb:19:in `create'
Event Create (0.4ms) INSERT INTO "events" ("name", "time", "description", "location", "created_at", "updated_at", "host_id") VALUES (?, ?, ?, ?, ?, ?, ?) [["name", "party"], ["time", "2021-01-15 18:20:00"], ["description", ""], ["location", ""], ["created_at", "2021-01-15 18:20:16.936730"], ["updated_at", "2021-01-15 18:20:16.936730"], ["host_id", 6]]
↳ app/controllers/events_controller.rb:19:in `create' TRANSACTION (1.4ms) commit transaction ↳ app/controllers/events_controller.rb:19:in `create'
Redirected to http://localhost:3000/events
Completed 302 Found in 32ms (ActiveRecord: 2.1ms | Allocations: 7464)
