{BaseCommand} = require './base'

module.exports =
class SearchTemplate extends BaseCommand

  run: ({searchType}={}) ->
    options =
      index: @index
      type: @docType
      body: @getText()

    options.searchType = searchType if searchType
    options.scroll = @scroll if searchType is "scan"

    @client.searchTemplate(options, @showResult)
