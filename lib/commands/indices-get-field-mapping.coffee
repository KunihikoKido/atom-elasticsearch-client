{BaseCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'
ListView = require '../views/list-view'


module.exports =
class IndicesGetFieldMapping extends BaseCommand

  run: ({field}={}) ->
    if not field
      return new InputView(
        'Required: field name to get mapping',
        (value) -> new IndicesGetFieldMapping(field: value))

    options =
      index: @index
      type: @docType
      field: field

    @client.indices.getFieldMapping(options, @showResult)
