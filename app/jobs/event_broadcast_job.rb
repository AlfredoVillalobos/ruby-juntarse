
class EventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user_id, events)    
    ActionCable.server.broadcast 'activity_channel', {events: events, 
                                                      user_id: user_id}
  end

  private

  def render_event(event, current_user)
    ApplicationController.renderer
                         .render( partial: 'events/event',
                                  locals: {
                                    event: event },
                                  assigns: {
                                    current_user: current_user
                                  }

                                )
  end
end
