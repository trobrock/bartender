Bartender = require './lib/bartender'
bartender = new Bartender()

timer = null
bartender.db.on 'idle', ->
  clearTimeout(timer) if timer?
  timer = setTimeout ->
    bartender.db.end()
  , 500

bartender.removeDrink { name: "Rum and Coke" }
bartender.removeIngredient { name: "Rum", description: "the best liquor ever", pin: 7 }
bartender.removeIngredient { name: "Coka Cola", pin: 5 }

bartender.addIngredient { name: "Rum", description: "the best liquor ever", pin: 7 }
bartender.addIngredient { name: "Coka Cola", pin: 5 }
bartender.addDrink {
  name: "Rum and Coke"
  description: "best drink eva"
  recipe: [["2 ounces", "Rum"], ["1 cup", "Coka Cola"]]
}
