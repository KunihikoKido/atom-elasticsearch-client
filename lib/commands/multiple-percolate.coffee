{BaseCommand} = require './base'

module.exports =
class MultiplePercolate extends BaseCommand

  run: ->
    options =
      index: @index
      type: @docType
      body: @getText()

    @client.mpercolate(options, @showResult)
