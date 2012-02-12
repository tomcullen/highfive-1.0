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
  end

end
