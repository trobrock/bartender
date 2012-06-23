class Ingredient
  name: null
  description: null
  pin: 0

  constructor: (options) ->
    @name        = options.name
    @description = options.description
    @pin         = options.pin

module.exports = Ingredient
