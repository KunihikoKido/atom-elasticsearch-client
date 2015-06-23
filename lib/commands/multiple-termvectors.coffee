{BaseCommand} = require './base'

module.exports =
class MultipleTermvectors extends BaseCommand

  run: ->
    options =
      index: @index
      type: @docType
      body: @getText()

    @client.mtermvectors(options, @showResult)
