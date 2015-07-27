{BaseCommand} = require './base'

module.exports =
class IndicesExists extends BaseCommand

  isEnabled: ->
    return true

  run: ->
    options =
      index: @index

    @client.indices.exists(options, @showResult)
