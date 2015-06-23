{BaseCommand} = require './base'
InputView = require '../views/input-view'


module.exports =
class ExistsDocument extends BaseCommand

  run: ({id}={})->

    if not id
      return new InputView(
        'Required: document id to exists',
        (value) -> new ExistsDocument(id: value))

    options =
      index: @index
      type: @docType
      id: id

    @client.exists(options, @showResult)
