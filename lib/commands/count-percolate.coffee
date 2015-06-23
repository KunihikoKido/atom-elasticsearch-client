{BaseCommand} = require './base'

module.exports =
class CountPercolate extends BaseCommand

  run: ->
    options =
      index: @index
      type: @docType
      body: @getText()

    @client.countPercolate(options, @showResult)
