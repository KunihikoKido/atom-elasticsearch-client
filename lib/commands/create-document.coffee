InputView = require '../views/input-view'
{CreateCommand} = require './base'

module.exports =
class CreateDocument extends CreateCommand

  run: ({id}={}) ->
    if not id
      return new InputView(
        'Required: document id to create document',
        (value) -> new CreateDocument(id: value))

    options =
      index: @index
      type: @docType
      body: @getText()
      id: id

    @client.create(options, @showResult)
