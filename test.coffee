Drink       = require './lib/drink'
Ingredient  = require './lib/ingredient'
Measurement = require './lib/measurement'
msgpack     = require 'msgpack2'
util        = require 'util'

log = (obj) ->
  console.log "JSON", JSON.stringify(obj)
  console.log "msgpack", msgpack.unpack(msgpack.pack(obj))

drink = new Drink(name: "test drink")
log drink

ingredient = new Ingredient(name: "test ingredient", pin: 1)
log ingredient

measurement = Measurement.OUNCE
log measurement

drink.add ingredient, measurement
log drink

drink.add ingredient, measurement
log drink
