{BaseCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class IndicesExistsDocType extends BaseCommand

  run: ({docType}={}) ->
    if not docType
      return new InputView(
        'Required: document type name to exists',
        (value) -> new IndicesExistsDocType(docType: value))

    options =
      index: @index
      type: docType

    @client.indices.existsType(options, @showResult)
