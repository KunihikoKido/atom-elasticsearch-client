{BaseCommand} = require './base'

module.exports =
class Percolate extends BaseCommand

  run: ->
    options =
      index: @index
      type: @docType
      body: @getText()

    @client.percolate(options, @showResult)
