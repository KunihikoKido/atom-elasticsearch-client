{CreateCommand} = require './base'

module.exports =
class IndicesRefresh extends CreateCommand

  run: ->
    options =
      index: @index

    @client.indices.refresh(options, @showResult)
