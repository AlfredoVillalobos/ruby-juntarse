class EventsController < ApplicationController
  before_action :authenticate_user!

  # Just return a list of events
  def index
    @events = Event.last_events(current_user, 3)
  end

  def last_events
    @events = Event.last_events(current_user, 3)
  end
end
