redis       = require 'redis'
msgpack     = require './msgpack'
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
    @db.sadd "ingredients", msgpack.pack(new Ingredient(ingredient), true)

  removeIngredient: (ingredient) ->
    ingredient = this.findIngredient(ingredient.name)
    @db.srem "ingredients", msgpack.pack(ingredient, true)

  addIngredients: ->
    @db.smembers "ingredients", (err, ingredients) =>
      @ingredients.push new Ingredient(msgpack.unpack(ingredient)) for ingredient in ingredients

  createDrink: (drink) ->
    recipe = drink.recipe
    drink = new Drink(name: drink.name, description: drink.description)

    drink.add(this.findIngredient("Rum"), Measurement.OUNCE.times(2))
    drink.add(this.findIngredient("Coka Cola"), Measurement.CUP)

    @db.sadd "drinks", msgpack.pack(drink, true)

  createDrinks: ->
    @db.smembers "drinks", (err, drinks) =>
      @drinks.push new Drink(drink) for drink in drinks
    # This is temporary until the api is built
    if !@drinks.length
      this.createDrink(name: "Rum and Coke", description: "best drink eva", recipe: [["2 ounces", "Rum"], ["1 cup", "Coka Cola"]])
      this.createDrinks()

module.exports = Bartender
