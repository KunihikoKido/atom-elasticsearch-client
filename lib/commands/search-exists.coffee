{BaseCommand} = require './base'

module.exports =
class SearchExists extends BaseCommand

  run: ->
    options =
      index: @index
      type: @docType
      body: @getText()
      ignore: [404]

    @client.searchExists(options, @showResult)
