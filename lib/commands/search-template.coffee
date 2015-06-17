{BaseCommand} = require './base'

module.exports =
class SearchTemplate extends BaseCommand

  run: ({searchType}={}) ->
    options =
      index: @index
      type: @docType
      body: @getText()

    options.searchType = searchType if searchType

    @client.searchTemplate(options, @showResult)
