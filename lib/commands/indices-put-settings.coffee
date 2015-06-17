{CreateCommand} = require './base'

module.exports =
class IndicesPutSettings extends CreateCommand

  run: ->
    options =
      index: @index
      body: @getText()

    @client.indices.putSettings(options, @showResult)
