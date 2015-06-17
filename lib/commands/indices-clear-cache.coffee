{CreateCommand} = require './base'

module.exports =
class IndicesClearCache extends CreateCommand

  run: ->
    options =
      index: @index

    @client.indices.clearCache(options, @showResult)
