{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class GetPercolatorQuery extends BaseCommand

  run: ({id}={}) ->
    if not id
      return new InputView(
        'Required: percolator query id to get percolator query',
        (value) -> new GetPercolatorQuery(id: value))

    options =
      index: @index
      type: ".percolator"
      id: id

    @client.getSource(options, @showResult)
