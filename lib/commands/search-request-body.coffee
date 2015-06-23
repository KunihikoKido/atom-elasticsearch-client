{BaseCommand} = require './base'

module.exports =
class SearchRequestBody extends BaseCommand

  run: ({searchType}={}) ->
    options =
      index: @index
      type: @docType
      body: @getText()

    options.searchType = searchType if searchType

    @client.search(options, @showResult)
