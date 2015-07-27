{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class SearchUri extends BaseCommand

  isEnabled: ->
    return true

  run: ({query}={}) ->

    if query is undefined
      return new InputView(
        'Option: Query in the Lucene query string syntax. (default: "*")',
        (value) -> new SearchUri(query: value))

    options =
      index: @index
      type: @docType
      q: query = if query then query else "*"

    @client.search(options, @showResult)
