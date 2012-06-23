Ingredient  = require './ingredient'
Robot       = require './robot'
Drink       = require './drink'
Measurement = require './measurement'

class Bartender
  drinks: []
  ingredients: []

  constructor: ->
    @robot = new Robot()
    this.addIngredients()
    this.createDrinks()

  find: (name) ->
    (drink for drink in @drinks when drink.name == name)[0]

  findIngredient: (name) ->
    (ingredient for ingredient in @ingredients when ingredient.name == name)[0]

  make: (drink) ->
    console.log "Making a #{drink.name} bitch!"
    drink.recipe.forEach (item) =>
      ingredient  = item.ingredient
      amount      = item.amount

      @robot.run(ingredient.pin, amount.conversion)

  addIngredients: ->
    @ingredients.push new Ingredient(name: "Rum", description: "the best liquor ever", pin: 1)
    @ingredients.push new Ingredient(name: "Coka Cola", pin: 3)

  createDrinks: ->
    # Rum and coke
    rumCoke = new Drink()
    rumCoke.name = "Rum and Coke"
    rumCoke.add(this.findIngredient("Rum"), Measurement.OUNCE.times(2))
    rumCoke.add(this.findIngredient("Coka Cola"), Measurement.CUP)
    @drinks.push rumCoke

module.exports = Bartender
