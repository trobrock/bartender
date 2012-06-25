util      = require 'util'
express   = require 'express'
Bartender = require './lib/bartender'

app       = express.createServer()
bartender = new Bartender()

app.use express.bodyParser()

# POST /ingredients
app.post '/ingredients', (req, res) ->
  bartender.addIngredient(req.body)
  res.send { success: true }

# DELETE /ingredients
app.del '/ingredients', (req, res) ->
  console.log req.body
  bartender.removeIngredient(req.body)
  res.send { success: true }


# POST /order/create

app.post '/orders/create', (req, res) ->
  rumCoke = bartender.find("Rum and Coke")
  bartender.make(rumCoke)
  res.send { success: true }

app.listen(8080)
