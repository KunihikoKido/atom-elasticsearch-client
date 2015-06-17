{BaseCommand} = require './base'

module.exports =
class IndicesGetMapping extends BaseCommand

  run: ->
    options =
      index: @index
      type: @docType

    @client.indices.getMapping(options, @showResult)
