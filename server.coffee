util        = require 'util'
app         = require('express').createServer()
Bartender   = require './lib/bartender'

bartender = new Bartender()




# POST /order/create
# return JSON
#   {
#     "success": true
#   }


app.post '/orders/create', (req, res) ->
  rumCoke = bartender.find("Rum and Coke")
  bartender.make(rumCoke)
  res.send JSON.stringify({ success: true })

app.listen(8080)
