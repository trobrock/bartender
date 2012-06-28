redis       = require 'redis'
Ingredient  = require './ingredient'
Robot       = require './robot'
Drink       = require './drink'
Measurement = require './measurement'

class Bartender
  drinks: Drink.collection()
  ingredients: Ingredient.collection()

  constructor: ->
    @robot = new Robot()
    Ingredient.db = Drink.db = @db = redis.createClient()

  addIngredients: ->
    Ingredient.sync()

  addDrinks: ->
    Drink.sync()

  make: (drink) ->
    console.log "Making a #{drink.name} bitch!"
    drink.recipe.forEach (item) =>
      ingredient  = item.ingredient
      amount      = item.amount

      @robot.run(ingredient.pin, amount.conversion)

  addIngredient: (ingredient) ->
    Ingredient.create(ingredient)

  removeIngredient: (ingredient) ->
    ingredient = Ingredient.find(ingredient.name)
    @db.srem "ingredients", ingredient.pack()

  removeDrink: (drink) ->
    drink = Drink.find(drink.name)
    @drinks.splice(i, 1) for i,d in @drinks when d == drink
    @db.srem "drinks", drink.pack()

  addDrink: (drink) ->
    drink = Drink.create(drink)

    # Still need these to persist to the db
    drink.add(Ingredient.find("Rum"), Measurement.OUNCE.times(2))
    drink.add(Ingredient.find("Coka Cola"), Measurement.CUP)

module.exports = Bartender
