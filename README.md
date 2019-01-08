This is a web application to control multi-color lights using ActionCable. The app categorizes lights into groups such as "Living Room", "Guest Bathroom", etc. Users can use the interface to control groups of lights by either toggling them on (white light), off, or setting a custom color. Users can control their lights from anywhere in the world through the web application interface. 

The lights in this project are RGB LEDs attached to Arduino (NodeMCU with ESP8266) to demonstrate proof-of-concept. Future build-outs of this project could include:
- Modifying the application to control more robust light systems such as Philipps Hue.
- Plugging into a color palette generator API to colorize your house
- Expanding the dashboard to control other types of smart devices

Find the corresponding Arduino firmware code [here](https://github.com/emikaijuin/arduino-nodemcu-led-control-using-action-cable-firmware). 
