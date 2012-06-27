class Model
  find: -> null

Model.collection = -> @_collection ?= []
Model.db         = null
Model.key        = ""
Model.sync       = (callback) ->
  @db.smembers @key, (err, items) =>
    @collection().push new this(msgpack.unpack(item)) for item in items
    callback() if callback?

module.exports = Model
