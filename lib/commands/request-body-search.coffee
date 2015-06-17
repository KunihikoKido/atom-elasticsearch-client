{BaseCommand} = require './base'

module.exports =
class RequestBodySearch extends BaseCommand

  run: ({searchType}={}) ->
    options =
      index: @index
      type: @docType
      body: @getText()
      searchType: searchType

    @client.search(options, @showResult)
