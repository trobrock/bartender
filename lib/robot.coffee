arduino  = require 'duino'

class Robot
  board: null

  constructor: ->
    @board = new arduino.Board({ baudrate: 9600 })

  run: (pin, time) ->
    @board.digitalWrite(pin, @board.HIGH)
    setTimeout =>
      @board.digitalWrite(pin, @board.LOW)
    , time * 1000

module.exports = Robot
