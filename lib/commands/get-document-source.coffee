{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class GetDocumentSource extends BaseCommand

  run: ({id}={}) ->
    if not id
      return new InputView(
        'Required: document id to get document source',
        (value) -> new GetDocumentSource(id: value))

    options =
      index: @index
      type: @docType
      id: id

    @client.getSource(options, @showResult)
