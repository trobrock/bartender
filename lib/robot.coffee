arduino  = require 'duino'

class Robot
  run: (pin, time) ->
    board = new arduino.Board()
    board.digitalWrite(pin, board.HIGH)
    setInterval =>
      board.digitalWrite(pin, board.LOW)
    , time * 1000

module.exports = Robot
