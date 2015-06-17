{CreateCommand} = require './base'

module.exports =
class IndicesCreate extends CreateCommand

  run: ->
    options =
      index: @index

    @client.indices.create(options, @showResult)
