util = require 'util'
Drink = require './lib/drink'
Ingredient = require './lib/ingredient'
Measurement = require './lib/measurement'

rum = new Ingredient(name: "Rum", description: "the best liquor ever")
coke = new Ingredient(name: "Coka Cola")

# Rum and coke
rumCoke = new Drink()
rumCoke.add(rum, Measurement.OUNCE.times(2))
rumCoke.add(coke, Measurement.CUP)

console.log rumCoke.toString()
