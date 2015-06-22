{BaseCommand} = require './base'

module.exports =
class IndicesRecovery extends BaseCommand

  run: ->
    options =
      index: @index
    @client.indices.recovery(options, @showResult)
