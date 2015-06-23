{CreateCommand} = require './base'

module.exports =
class IndicesClose extends CreateCommand

  run: ->
    options =
      index: @index

    @client.indices.close(options, @showResult)
