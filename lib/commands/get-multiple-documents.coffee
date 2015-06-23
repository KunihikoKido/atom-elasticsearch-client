{BaseCommand} = require './base'

module.exports =
class GetMultipleDocuments extends BaseCommand

  run: ->
    options =
      index: @index
      type: @docType
      body: @getText()

    @client.mget(options, @showResult)
