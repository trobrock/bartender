redis       = require 'redis'
Ingredient  = require './ingredient'
Robot       = require './robot'
Drink       = require './drink'
Measurement = require './measurement'

class Bartender
  drinks: []
  ingredients: []

  constructor: ->
    @robot = new Robot()
    @db = redis.createClient()

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

  addIngredient: (ingredient) ->
    @db.sadd "ingredients", JSON.stringify(new Ingredient(ingredient))

  removeIngredient: (ingredient) ->
    ingredient = this.findIngredient(ingredient.name)
    @db.srem "ingredients", JSON.stringify(ingredient)

  addIngredients: ->
    @db.smembers "ingredients", (err, ingredient) =>
      @ingredients.push new Ingredient(JSON.parse(ingredient))

  createDrinks: ->
    # Rum and coke
    rumCoke = new Drink()
    rumCoke.name = "Rum and Coke"
    rumCoke.add(this.findIngredient("Rum"), Measurement.OUNCE.times(2))
    rumCoke.add(this.findIngredient("Coka Cola"), Measurement.CUP)
    console.log JSON.stringify(rumCoke)
    @drinks.push rumCoke

module.exports = Bartender
