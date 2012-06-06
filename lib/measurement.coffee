class Measurement
  conversion: 1

  initialize: (conversion) ->
    @conversion = conversion

OUNCE = new Measurement(1)
SHOT = new Measurement(2)
CUP = new Measurement(8)
