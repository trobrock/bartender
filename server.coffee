util      = require 'util'
express   = require 'express'
Bartender = require './lib/bartender'

PORT      = 8080
app       = express.createServer()
bartender = new Bartender()

# Load object from redis
bartender.addIngredients()
bartender.createDrinks()

# Auto parse json
app.use express.bodyParser()


##### Drinks #####
# GET /drinks
# List all drinks

# PUT /drinks
# Update a drink

# POST /drinks
# Create a drink

# DELETE /drinks
# Delete a drink


##### Ingredients #####
# GET /ingredients
# List all ingredients

# PUT /ingredients
# Update an ingredient

# POST /ingredients
# Create an ingredient
app.post '/ingredients', (req, res) ->
  bartender.addIngredient(req.body)
  res.send { success: true }

# DELETE /ingredients
# Delete an ingredient
app.del '/ingredients', (req, res) ->
  console.log req.body
  bartender.removeIngredient(req.body)
  res.send { success: true }


##### Orders #####
# POST /orders
# Create a new order
app.post '/orders', (req, res) ->
  rumCoke = bartender.find("Rum and Coke")
  bartender.make(rumCoke)
  res.send { success: true }

# Listen somewhere
app.listen(PORT)
