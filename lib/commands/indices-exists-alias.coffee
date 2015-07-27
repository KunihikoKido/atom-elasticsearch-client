{BaseCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class IndicesExistsAlias extends BaseCommand

  isEnabled: ->
    return true

  run: ({name}={}) ->
    if not name
      return new InputView(
        'Required: alias name to exists',
        (value) -> new IndicesExistsAlias(name: value))

    options =
      index: @index
      name: name

    @client.indices.existsAlias(options, @showResult)
