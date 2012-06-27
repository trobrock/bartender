Drink       = require './lib/drink'
Ingredient  = require './lib/ingredient'
Measurement = require './lib/measurement'
msgpack     = require 'msgpack2'
util        = require 'util'

log = (obj) ->
  console.log msgpack.unpack(msgpack.pack(obj))

ingredient = new Ingredient(name: "test ingredient", pin: 1)
test_obj = {recipe: [ingredient, ingredient]}
log test_obj