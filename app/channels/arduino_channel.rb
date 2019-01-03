class ArduinoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "arduino"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    light = Light.find_or_create_by(fingerprint: data.dig("mac"))
  end
end
