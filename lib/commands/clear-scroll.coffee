InputView = require '../views/input-view'
{CreateCommand} = require './base'

module.exports =
class ClearScroll extends CreateCommand

  run: ({scrollId}={}) ->
    if not scrollId
      return new InputView(
        'Option: document id to index document',
        (value) -> new ClearScroll(scrollId: value))

    options =
      scrollId: scrollId

    @client.clearScroll(options, @showResult)
