{CreateCommand} = require './base'
InputView = require '../views/input-view'
dialog = require '../dialog'


module.exports =
class IndicesPutAlias extends CreateCommand

  isEnabled: ->
    return true

  run: ({name}={}) ->
    if not name
      return new InputView(
        'Required: alias name to create',
        (value) -> new IndicesPutAlias(name: value))

    options =
      index: @index
      name: name

    @client.indices.putAlias(options, @showResult)
