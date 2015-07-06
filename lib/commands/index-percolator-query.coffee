InputView = require '../views/input-view'
{CreateCommand} = require './base'

module.exports =
class IndexPercolatorQuery extends CreateCommand

  run: ({id}={}) ->
    if id is undefined
      return new InputView(
        'Options: percolate query id to index query',
        (value) -> new IndexPercolatorQuery(id: value))

    options =
      index: @index
      type: ".percolator"
      body: @getText()

    options.id = id if id

    @client.index(options, @showResult)
