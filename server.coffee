util        = require 'util'
http        = require 'http'
Bartender   = require './lib/bartender'

bartender = new Bartender()




# POST /order/create
# return JSON
#   {
#     "success": true
#   }


server = http.createServer (req, res) ->
  switch req.method
    when "POST"
      switch req.url
        when "/order/create"
          rumCoke = bartender.find("Rum and Coke")
          bartender.make(rumCoke)
          res.write JSON.stringify({ success: true })
  res.end()
server.listen(8080)
