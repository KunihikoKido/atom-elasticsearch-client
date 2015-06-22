{BaseCommand} = require './base'

module.exports =
class IndicesStatus extends BaseCommand

  run: ->
    options =
      human: true
      index: @index

    @client.indices.status(options, @showResult)
