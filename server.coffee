util        = require 'util'
Bartender   = require './lib/bartender'

bartender = new Bartender()

rumCoke = bartender.find("Rum and Coke")
bartender.make(rumCoke)

