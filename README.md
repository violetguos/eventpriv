# Eventpriv

Invite friends to your private events!!

Project from [Odin](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations)

## Rails lessons

Run `rails generate scaffold_controller User` to add view and controller to existing models

How to set up login in vanilla rails without devise, [tutorial](https://imvishaltyagi444.wordpress.com/2018/01/19/authentication-without-devise-in-rails/)

## Create event

rails generate model Event name:string time:datetime description:text location:text

rails generate migration AddUserToEvents

rails g migration AddForeignKeyToEvent
