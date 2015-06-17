InputView = require '../views/input-view'
{CreateCommand} = require './base'

module.exports =
class IndexDocument extends CreateCommand

  run: ({id}={}) ->
    if id is undefined
      return new InputView(
        'Option: document id to index document',
        (value) -> new IndexDocument(id: value))

    options =
      index: @index
      type: @docType
      body: @getText()

    options.id = id if id

    @client.index(options, @showResult)
