{DeleteCommand} = require './base'

module.exports =
class IndicesDeleteMapping extends DeleteCommand

  run: ->
    options =
      index: @index
      type: @docType

    @client.indices.deleteMapping(options, @showResult)
