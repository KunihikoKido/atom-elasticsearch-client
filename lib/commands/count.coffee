{BaseCommand} = require './base'

module.exports =
class Count extends BaseCommand

  run: ->
    options =
      index: @index
      type: @docType
      body: @getText()

    @client.count(options, @showResult)
