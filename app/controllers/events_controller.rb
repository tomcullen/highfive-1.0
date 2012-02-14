class EventsController < ApplicationController
  def index
    @active_events = current_user.events.where(state: "active")
    @inactive_events = current_user.events.where(state: "inactive")
  end

  def show
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    @event.user = current_user
    @event.state = "active"
    @event.save
    redirect_to events_url
  end

  def edit
    @event = Event.find_by_id(params[:id])
  end
  
  def update
    event = Event.find_by_id(params[:id])
    event.update_attributes(params[:event])
    if params[:commit] == "Edit Event"
      redirect_to events_url
    elsif params[:commit] == "Proceed to Next Event"
      event.update_attributes(state: "inactive")
      redirect_to new_event_url(id: event.contact), notice: "Your event with #{event.contact.combined_name} is complete.  Create yoru next one with #{event.contact.combined_name} Now!"
    end
  end

end
