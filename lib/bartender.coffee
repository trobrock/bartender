redis       = require 'redis'
msgpack     = require './msgpack'
Ingredient  = require './ingredient'
Robot       = require './robot'
Drink       = require './drink'
Measurement = require './measurement'

class Bartender
  drinks: Drink.collection()
  ingredients: Ingredient.collection()

  constructor: ->
    @robot = new Robot()
    @db = redis.createClient()
    Ingredient.db = redis.createClient()
    Drink.db = redis.createClient()

  find: (name) ->
    (drink for drink in @drinks when drink.name == name)[0]

  make: (drink) ->
    console.log "Making a #{drink.name} bitch!"
    drink.recipe.forEach (item) =>
      ingredient  = item.ingredient
      amount      = item.amount

      @robot.run(ingredient.pin, amount.conversion)

  findIngredient: (name) ->
    (ingredient for ingredient in @ingredients when ingredient.name == name)[0]

  addIngredient: (ingredient) ->
    ingredient = new Ingredient(ingredient)
    @ingredients.push ingredient
    @db.sadd "ingredients", msgpack.pack(ingredient, true)

  removeIngredient: (ingredient) ->
    ingredient = this.findIngredient(ingredient.name)
    @db.srem "ingredients", msgpack.pack(ingredient, true)

  addIngredients: ->
    Ingredient.sync()

  removeDrink: (drink) ->
    drink = this.find(drink.name)
    @drinks.splice(i, 1) for i,d in @drinks when d == drink
    @db.srem "drinks", msgpack.pack(drink, true)

  addDrink: (drink) ->
    recipe = drink.recipe

    drink = new Drink(drink)

    drink.add(this.findIngredient("Rum"), Measurement.OUNCE.times(2))
    drink.add(this.findIngredient("Coka Cola"), Measurement.CUP)

    @db.sadd "drinks", msgpack.pack(drink, true)

  addDrinks: ->
    Drink.sync()

module.exports = Bartender
