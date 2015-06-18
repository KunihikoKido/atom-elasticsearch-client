{DeleteCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class DeleteDocument extends DeleteCommand

  run: ({id}={}) ->
    if not id
      return new InputView(
        'Required: document id to delete document',
        (value) -> new DeleteDocument(id: value))

    options =
      index: @index
      type: @docType
      id: id

    @client.delete(options, @showResult)
