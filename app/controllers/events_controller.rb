class EventsController < ApplicationController
  before_action :logged_in?, except: [:index]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
      if @event.save

        redirect_to events_path

      else
        redirect_to '/signup'
      end
    
  end

  private
    
    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :location, :time, :description, :host_id)
    end
end