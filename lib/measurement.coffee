class Measurement
  conversion: 1

  constructor: (conversion) ->
    @conversion = conversion

  times: (num) ->
    new Measurement(@conversion * num)

Measurement.OUNCE = new Measurement(1)
Measurement.SHOT = new Measurement(2)
Measurement.CUP = new Measurement(8)

module.exports = Measurement
