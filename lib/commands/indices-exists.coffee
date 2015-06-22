{BaseCommand} = require './base'

module.exports =
class IndicesExists extends BaseCommand

  run: ->
    options =
      index: @index

    @client.indices.exists(options, @showResult)
