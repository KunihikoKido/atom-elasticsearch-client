{CreateCommand} = require './base'

module.exports =
class IndicesPutTemplate extends CreateCommand

  run: ->
    options =
      index: @index
      body: @getText()

    @client.indices.putTemplate(options, @showResult)
