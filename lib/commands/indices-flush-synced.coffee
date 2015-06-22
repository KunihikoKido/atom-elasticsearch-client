{CreateCommand} = require './base'

module.exports =
class IndicesFlushSynced extends CreateCommand

  run: ->
    options =
      index: @index

    @client.indices.flushSynced(options, @showResult)
