{BaseCommand} = require './base'

module.exports =
class IndicesGet extends BaseCommand

  run: ->
    options =
      index: @index
    @client.indices.get(options, @showResult)
