{BaseCommand} = require './base'

module.exports =
class MultipleSearch extends BaseCommand

  run: ->
    options =
      index: @index
      type: @docType
      body: @getText()

    @client.msearch(options, @showResult)
