{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class GetDocument extends BaseCommand

  isEnabled: ->
    return true

  run: ({id}={}) ->
    if not id
      return new InputView(
        'Required: document id to get document',
        (value) -> new GetDocument(id: value))

    options =
      index: @index
      type: @docType
      id: id

    @client.get(options, @showResult)
