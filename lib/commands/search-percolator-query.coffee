{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class SearchPercolatorQuery extends BaseCommand

  run: ({query}={}) ->

    if query is undefined
      return new InputView(
        'Option: Prefix search for percolator query id.',
        (value) -> new SearchPercolatorQuery(query: value))

    prefixSearch = {
      "query": {
        "prefix": {
          "_id": "#{query}"
        }
      }
    }

    options =
      index: @index
      type: ".percolator"

    if query
      options.body = prefixSearch

    @client.search(options, @showResult)
