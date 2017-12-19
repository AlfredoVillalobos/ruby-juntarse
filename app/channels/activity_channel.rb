# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"
  end
 
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_event(data)
    @usr = User.find(data['user'])
    EventBroadcastJob.perform_later(@usr.id, Event.count_unviewed_events(@usr))
  end
end
