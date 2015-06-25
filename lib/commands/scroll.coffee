{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class Scroll extends BaseCommand

  run: ({scrollId}={}) ->

    if not scrollId
      return new InputView(
        'Required: scroll id to scroll a search request',
        (value) -> new Scroll(scrollId: value))

    options =
      scrollId: scrollId
      scroll: @scroll

    @client.scroll(options, @showResult)
