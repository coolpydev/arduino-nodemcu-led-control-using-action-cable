class ArduinoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "arduino"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
