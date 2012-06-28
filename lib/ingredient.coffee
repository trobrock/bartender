Model = require './model'

class Ingredient extends Model
  _attributes: ["name", "description", "pin"]

  name: null
  description: null
  pin: 0

  constructor: (options) ->
    @name        = options.name
    @description = options.description
    @pin         = options.pin

Ingredient.key = "ingredients"

module.exports = Ingredient
