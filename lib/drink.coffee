Model = require './model'

class Drink extends Model
  name: null
  description: null
  recipe: []

  constructor: (options={}) ->
    @name = options.name
    @description = options.description

  add: (ingredient, amount) ->
    @recipe.push(ingredient: ingredient, amount: amount)

  toString: ->
    string = @recipe.map (ingredient) ->
      "#{ingredient.amount.conversion} units of #{ingredient.ingredient.name}"
    string.join(", ")

Drink.key = "drinks"

module.exports = Drink
