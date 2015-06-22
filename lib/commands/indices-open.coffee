{CreateCommand} = require './base'

module.exports =
class IndicesOpen extends CreateCommand

  run: ->
    options =
      index: @index

    @client.indices.open(options, @showResult)
