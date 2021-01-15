class EventsController < ApplicationController
  before_action :logged_in?, except: [:index]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :attend]

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
        flash[:error] = "`failed to save event: #{@event.name}`"
        redirect_to events_path

      end
    
  end

  def attend
    if !@event.attendees.include?(current_user)
      @event.attendees << current_user
      flash[:notice] = "`You are now attending: #{@event.name}`"
      redirect_to events_path
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :location, :time, :description, :host_id)
    end
end