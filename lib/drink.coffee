class Drink
  name: null
  description: null
  recipe: [{ ingredient: rum, amount: shot }, { ingredient: coke, amount: 0.5 * cup }]

  add: (ingredient, amount) ->
    @recipe.push(ingredient: ingredient, amount: amount)
