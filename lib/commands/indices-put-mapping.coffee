{CreateCommand} = require './base'

module.exports =
class IndicesPutMapping extends CreateCommand

  run: ->
    options =
      index: @index
      type: @docType
      body: @getText()

    @client.indices.putMapping(options, @showResult)
