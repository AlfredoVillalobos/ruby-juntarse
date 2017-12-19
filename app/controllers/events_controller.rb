class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Event.last_events(current_user, 3)
  end

  def last_events
    @events = Event.last_events(current_user, 3)
  end
end
