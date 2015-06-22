{CreateCommand} = require './base'

module.exports =
class IndicesOptimize extends CreateCommand

  run: ->
    options =
      index: @index

    @client.indices.optimize(options, @showResult)
