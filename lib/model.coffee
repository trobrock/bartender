msgpack = require './msgpack'

class Model
  pack: ->
    packableObject = {}
    packableObject[attr] = this[attr] for attr in @_attributes

    msgpack.pack packableObject, true

Model.collection = -> @_collection ?= []
Model.db         = null
Model.key        = ""
Model.sync       = (callback) ->
  @db.smembers @key, (err, items) =>
    @collection().push new this(msgpack.unpack(item)) for item in items
    callback() if callback?

module.exports = Model
