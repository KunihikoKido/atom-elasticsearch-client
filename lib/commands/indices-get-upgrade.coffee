{BaseCommand} = require './base'

module.exports =
class IndicesGetUpgrade extends BaseCommand

  run: ->
    options =
      index: @index
      human: true

    @client.indices.getUpgrade(options, @showResult)
