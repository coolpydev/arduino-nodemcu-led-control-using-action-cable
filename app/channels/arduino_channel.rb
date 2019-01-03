class ArduinoChannel < ApplicationCable::Channel
  def subscribed
  end
  
  def identify_device(data)
    @light = Light.find_or_create_by(fingerprint: data.dig("mac"))
    # Control via individual light channel
    stream_from "arduino_#{@light.fingerprint}"
    ActionCable.server.broadcast("arduino_#{@light.fingerprint}", message: "You're all plugged in, Ada!")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
  end
end
