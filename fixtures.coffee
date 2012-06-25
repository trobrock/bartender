Bartender = require './lib/bartender'
bartender = new Bartender()

bartender.removeIngredient { name: "Rum", description: "the best liquor ever", pin: 7 }
bartender.removeIngredient { name: "Coka Cola", pin: 5 }

bartender.addIngredient { name: "Rum", description: "the best liquor ever", pin: 7 }
bartender.addIngredient { name: "Coka Cola", pin: 5 }

bartender.db.end()
