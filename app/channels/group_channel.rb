class GroupChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    channel = "group_#{params[:id]}"
    stream_from channel
    ActionCable.server.broadcast(channel, rgb: { r: "125", g: "10", b: "125" })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
