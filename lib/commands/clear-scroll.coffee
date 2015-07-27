InputView = require '../views/input-view'
{CreateCommand} = require './base'

module.exports =
class ClearScroll extends CreateCommand

  isEnabled: ->
    return true

  run: ({scrollId}={}) ->
    if not scrollId
      return new InputView(
        'Required: scroll id to clear',
        (value) -> new ClearScroll(scrollId: value))

    options =
      scrollId: scrollId

    @client.clearScroll(options, @showResult)
