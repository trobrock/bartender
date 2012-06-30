util      = require 'util'
express   = require 'express'
Bartender = require './lib/bartender'
Drink = require './lib/drink'

PORT      = 8080
app       = express.createServer()
bartender = new Bartender()

# Load object from redis
bartender.addIngredients()
bartender.addDrinks()

# Auto parse json
app.use express.bodyParser()

# This should neable us to develop locally with cross domain support
allowCrossDomain = (req, res, next) ->
  res.header('Access-Control-Allow-Origin', '*')
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
  res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With')

  # intercept OPTIONS method
  if ('OPTIONS' == req.method)
    res.send(200)
  else
    next()

app.use(allowCrossDomain)


##### Drinks #####
# GET /drinks
# List all drinks
app.get '/drinks', (req, res) ->
  res.send bartender.drinks

# PUT /drinks
# Update a drink

# POST /drinks
# Create a drink

# DELETE /drinks
# Delete a drink


##### Ingredients #####
# GET /ingredients
# List all ingredients
app.get '/ingredients', (req, res) ->
  util.log "Listing ingredients"
  res.send bartender.ingredients

# PUT /ingredients
# Update an ingredient

# POST /ingredients
# Create an ingredient
app.post '/ingredients', (req, res) ->
  util.log "Create new ingredient #{util.inspect(req.body)}"
  bartender.addIngredient(req.body)
  res.send { success: true }

# DELETE /ingredients
# Delete an ingredient
app.del '/ingredients', (req, res) ->
  util.log "Deleting ingredient #{util.inspect(req.body)}"
  bartender.removeIngredient(req.body)
  res.send { success: true }


##### Orders #####
# POST /orders
# Create a new order
app.post '/orders', (req, res) ->
  rumCoke = Drink.find(name="Rum and Coke")
  if not rumCoke
    Drink.create(name="Rum and Coke")
    rumCoke = Drink.find("Rum and Coke")
  bartender.make(rumCoke)
  res.send { success: true }

# Listen somewhere
util.log "Listening on port #{PORT}"
app.listen(PORT)
