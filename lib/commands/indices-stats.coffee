{BaseCommand} = require './base'

module.exports =
class IndicesStats extends BaseCommand

  run: ->
    options =
      human: true
      index: @index
      
    @client.indices.stats(options, @showResult)
