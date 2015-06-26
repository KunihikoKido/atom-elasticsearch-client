{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class Termvector extends BaseCommand

  run: ({id}={}) ->
    if id is undefined
      return new InputView(
        'Option: document id to termvector',
        (value) -> new Termvector(id: value))

    options =
      index: @index
      type: @docType
      body: @getText()

    options.id = id if id

    @client.termvector(options, @showResult)
