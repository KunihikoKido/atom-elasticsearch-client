{CreateCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class UpdateDocument extends CreateCommand

  run: ({id}={}) ->
    if not id
      return new InputView(
        'Required: document id to update',
        (value) -> new UpdateDocument(id: value))

    options =
      index: @index
      type: @docType
      id: id
      body: @getText()

    @client.termvector(options, @showResult)
