class Drink
  name: null
  description: null
  recipe: []

  add: (ingredient, amount) ->
    @recipe.push(ingredient: ingredient, amount: amount)

  toString: ->
    string = @recipe.map (ingredient) ->
      "#{ingredient.amount.conversion} units of #{ingredient.ingredient.name}"
    string.join(", ")

module.exports = Drink
