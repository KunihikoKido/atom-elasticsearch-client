{CreateCommand} = require './base'

module.exports =
class IndicesFlush extends CreateCommand

  run: ->
    options =
      index: @index

    @client.indices.flush(options, @showResult)
