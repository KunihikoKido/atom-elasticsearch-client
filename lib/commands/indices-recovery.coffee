{BaseCommand} = require './base'

module.exports =
class IndicesRecovery extends BaseCommand

  run: ->
    options =
      human: true
      index: @index

    @client.indices.recovery(options, @showResult)
