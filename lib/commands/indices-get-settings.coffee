{BaseCommand} = require './base'

module.exports =
class IndicesGetSettings extends BaseCommand

  run: ->
    options =
      index: @index
    @client.indices.getSettings(options, @showResult)
