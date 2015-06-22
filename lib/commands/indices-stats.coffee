{BaseCommand} = require './base'

module.exports =
class IndicesStats extends BaseCommand

  run: ->
    options =
      index: @index
    @client.indices.stats(options, @showResult)
