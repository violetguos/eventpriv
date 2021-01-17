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

## Login with username only

I initially tried to bypass password and email in Devise. However, that's the entire point of using Devise. I managed to eliminate email. Instead, an easier solution is to program login and `session` from scratch.

## associations

`app/models/event_attending.rb`

## Use partial views

In order to organize HTML and ERB files, I used partials in `events` and `home`

## create new actions

in order to add event attendence, I customized `#attend` under `EventsController`. However, when rendering the partial, `#attend` requires the `Event` object. For `app/views/events/show.html.erb`, Rails router automatically invokes

```
event GET    /events/:id(.:format)                                                                             events#show
```

but for customized action,

```
attend_event GET    /events/:id/attend(.:format)                                                                      events#attend

```

Rails requires `<%= link_to 'Attend', attend_event_path(event)%>`, and cannot automatically resolve which event it is if we call `<%= link_to 'Attend', attend_event_path %>`. See commit [810134](https://github.com/violetguos/eventpriv/commit/8101349668a57b22ff7b53a3d53438109dd2f734)

This took me a while. Although the Odin discord didn't entirely answer my question, they pointed me in the right direction.

## associations

I used the following table to model `User` attending `Events`

```
# db/migrate/20210115172541_create_event_attendings.rb
    t.references :attended_event, references: :event
    t.references :event_attendee, references: :user
```

I actually could keep `:attended_event` as `:event`, the renaming is just for readability.
